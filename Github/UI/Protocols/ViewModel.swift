//
//  ViewModel.swift
//  Github
//
//  Created by Alexandre on 03.09.21.
//

import Foundation
import RxSwift
import RxCocoa
protocol ViewModel: AnyObject {
    var repositories: BehaviorRelay<[ReposModel]> {get}
    var selectedIndex: Int {get set}
    var avatar: String {get}
    var userName: String {get}
    var repositoryName: String {get}
    var repository: ReposModel {get}
    func modelAt(_ index: Int)
}
extension ViewModel {
     func modelAt(_ index: Int) {
        selectedIndex = index
    }
    var avatar: String {
        return repositories.value[selectedIndex].owner?.avatar_url ?? ""
    }
    var userName: String {
        return repositories.value[selectedIndex].owner?.login ?? ""
    }
    var repositoryName: String {
        return repositories.value[selectedIndex].name ?? ""
    }
    var repository: ReposModel {
        return repositories.value[selectedIndex]
    }
    
}
