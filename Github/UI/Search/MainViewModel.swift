//
//  MainViewModel.swift
//  Github
//
//  Created by Alexandre on 02.09.21.
//

import Foundation
import RxCocoa
import RxSwift
class MainViewModel: ViewModel {
    var repositories = BehaviorRelay(value: [ReposModel]())
    var text = BehaviorRelay(value: "")
    var db = DisposeBag()
    var reload = BehaviorRelay(value: false)
    var selectedIndex = 0
    init () {
        configure()
    }
    func configure() {
        text.subscribe(onNext: { [unowned self] value in
            self.fetchRepositories(user: value)
        }).disposed(by: db)
    }
    func fetchRepositories(user: String) {
        if user.isEmpty == false {
            Repositor.getRepositories(user: user, completion: { result in
                self.repositories.accept(result)
                self.reload.accept(true)
            })
        }
    }
}
