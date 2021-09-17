//
//  StarredViewModel.swift
//  Github
//
//  Created by Alexandre on 06.09.21.
//

import Foundation
import RxSwift
import RxCocoa
class StarredViewModel: ViewModel {
    var repositories = BehaviorRelay(value: [ReposModel]())
    var reload = BehaviorRelay(value: false)
    var db = DisposeBag()
    var selectedIndex = 0
    var rep = [Repos]()
    func viewWillAppear() {
        fetchRepositories()
    }
    func fetchRepositories() {
        self.rep = CoreDataManager.fetchRepositories()
        repositories.accept(rep.map{ ReposModel(name: $0.name, owner: $0.owner.map{ Owner(login: $0.login, avatar_url: $0.avatar)}, description: $0.reposDescription, html_url: $0.url, created_at: $0.dateCreated, language: $0.language)})
        reload.accept(true)
    }
   
}
