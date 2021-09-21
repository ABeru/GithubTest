//
//  APIConstants.swift
//  Github
//
//  Created by Alexandre on 02.09.21.
//

enum API {
    static let address = "https://api.github.com"
    enum Endpoints: String {
        case user       = "/users/"
        case repository = "/repos"
        case page       = "?&page="
    }
}
