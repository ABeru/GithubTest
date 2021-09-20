//
//  EntityDesc.swift
//  Github
//
//  Created by Alexandre on 20.09.21.
//

import Foundation
import CoreData
final class EntityDesc {
    func createEntity(_ firstEntity: Repos, _ secondEntity: ReposOwner, _ repos: ReposModel) {
        secondEntity.login = repos.owner?.login
        secondEntity.avatar = repos.owner?.avatar_url
        firstEntity.owner = secondEntity
        firstEntity.dateCreated = repos.created_at
        firstEntity.language = repos.language
        firstEntity.name = repos.name
        firstEntity.reposDescription = repos.description
        firstEntity.url = repos.html_url
    
    }
}
