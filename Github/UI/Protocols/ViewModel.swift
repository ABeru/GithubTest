//
//  ViewModel.swift
//  Github
//
//  Created by Alexandre on 03.09.21.
//

import Foundation
protocol ViewModel: AnyObject {
    var repositories: [ReposModel] {get}
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
        return repositories[selectedIndex].owner?.avatar_url ?? ""
    }
    var userName: String {
        return repositories[selectedIndex].owner?.login ?? ""
    }
    var repositoryName: String {
        return repositories[selectedIndex].name ?? ""
    }
    var repository: ReposModel {
        return repositories[selectedIndex]
    }
    
}
