//
//  MainViewModel.swift
//  Github
//
//  Created by Alexandre on 02.09.21.
//

import Foundation
class MainViewModel: ViewModel {
    var repositories = [ReposModel]()
    var selectedIndex = 0
    func fetchRepositories(user: String, _ completion: @escaping () -> Void) {
        if user.isEmpty == false {
        Repositor.getRepositories(user: user, completion: { result in
            self.repositories = result
            completion()
        })
        } else {
            repositories.removeAll()
            completion()
        }
    }
}
