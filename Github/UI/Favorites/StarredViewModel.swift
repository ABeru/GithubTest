//
//  StarredViewModel.swift
//  Github
//
//  Created by Alexandre on 06.09.21.
//

import Foundation
class StarredViewModel: ViewModel {
    var repositories = [ReposModel]()
    var selectedIndex = 0
    var rep = [Repos]()
    func fetchFavorites(_ completion: () -> Void) {
        rep = CoreDataManager.fetchRepositories()
        repositories = rep.map{ ReposModel(name: $0.name, owner: $0.owner.map{ Owner(login: $0.login, avatar_url: $0.avatar)}, description: $0.reposDescription, html_url: $0.url, created_at: $0.dateCreated, language: $0.language)}

        completion()
    }
}
