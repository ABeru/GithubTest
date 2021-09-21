//
//  ReposModel.swift
//  Github
//
//  Created by Alexandre on 02.09.21.
//

import Foundation
struct ReposModel: Codable{
    
    let name: String?
    let owner: Owner?
    let description: String?
    let html_url: String?
    let created_at: String?
    let language: String?
    init(name: String?, owner: Owner?, description: String?, html_url: String?, created_at: String?, language: String?) {
        self.name = name
        self.owner = owner
        self.description = description
        self.html_url = html_url
        self.language = language
        self.created_at = created_at
    }
}
struct Owner: Codable {
    let login: String?
    let avatar_url: String?
    init(login: String?, avatar_url: String?) {
        self.login = login
        self.avatar_url = avatar_url
    }
}
