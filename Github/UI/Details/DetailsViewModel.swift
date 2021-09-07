//
//  DetailsViewModel.swift
//  Github
//
//  Created by Alexandre on 03.09.21.
//

import Foundation
import UIKit
import CoreData
class DetailsViewModel {
    var repository: ReposModel
    var check = false
    var date: String {
        var n = repository.created_at?.replacingOccurrences(of: "T", with: "\n") ?? ""
        n.removeLast()
        return n
    }
    var description: String {
        return repository.description ?? ""
    }
    var language: String {
        return repository.language ?? ""
    }
    init(repository: ReposModel) {
        self.repository = repository
    }
    func linkPressed() {
        guard let url = URL(string: repository.html_url ?? "") else {return}
        UIApplication.shared.open(url)
    }
    func saveRepository() {
        CoreDataManager.addFavorite(repository)
    }
    func removeRepository() {
        guard let repos1 = CoreDataManager.fetchRepositories().first(where: { $0.url == repository.html_url}) else {return}
        CoreDataManager.removeFavorite(repos: repos1, completion: { result in
            switch result {
            case .success(_):
                print("")
            case .failure(let error):
                print(error)
                return
            }

        })
    }
    func checkFavorites(_ completion: @escaping () -> Void) {
        for n in CoreDataManager.fetchRepositories() {
            if n.url == repository.html_url {
                check = true
                completion()
            }
        }
    }
}
