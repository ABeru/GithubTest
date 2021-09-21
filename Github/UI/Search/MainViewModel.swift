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
    var page = BehaviorRelay(value: 1)
    var reload = BehaviorRelay(value: false)
    var selectedIndex = 0
    init () {
        configure()
    }
    func configure() {
        text.subscribe(onNext: { [unowned self] value in
            self.fetchRepositories(user: value)
        }).disposed(by: db)
        page.subscribe(onNext: { number in
            self.addPage(user: self.text.value, page: self.page.value)
        }).disposed(by: db)
    }
    func fetchRepositories(user: String) {
        if user.isEmpty == false {
            Repositor.getRepositories(user: user, page: 1, completion: { result in
                self.repositories.accept(result)
                self.reload.accept(true)
            })
        }
        else {
            repositories.accept([ReposModel]())
            reload.accept(true)
        }
    }
    func addPage(user: String, page: Int) {
        Repositor.getRepositories(user: user, page: page, completion: { result in
            if !result.isEmpty {
                self.repositories.accept(self.repositories.value + result)
                self.reload.accept(true)
            }
        })
    }

}
