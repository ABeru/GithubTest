//
//  DetailsViewModel.swift
//  Github
//
//  Created by Alexandre on 03.09.21.
//

import Foundation
import UIKit
import CoreData
import RxSwift
import RxCocoa
class DetailsViewModel {
    var repository: ReposModel
    var check = BehaviorRelay(value: false)
    var db = DisposeBag()
    var color = "Blue"
    var img = BehaviorRelay(value: "star")
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
        checkFavorites()
    }
    func linkPressed() {
        guard let url = URL(string: repository.html_url ?? "") else {return}
        UIApplication.shared.open(url)
    }
    
    func buttonClicked() {
         addOrRemove()
    }
    func addOrRemove() {
        if check.value == true {
            removeRepository()
        }
        else {
            saveRepository()
        }
    }
    func saveRepository() {
        CoreDataManager.addFavorite(repository)
        img.accept("star.fill")
        check.accept(true)
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
        img.accept("star")
        check.accept(false)
    }
    func checkFavorites() {
            for n in CoreDataManager.fetchRepositories() {
                if n.url == repository.html_url {
                check.accept(true)
                img.accept("star.fill")
                }
            }

    }
}
