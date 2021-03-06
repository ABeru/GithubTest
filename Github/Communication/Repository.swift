//
//  Repository.swift
//  Github
//
//  Created by Alexandre on 02.09.21.
//

import Foundation
final class Repositor {
    static func getRepositories(user: String, page: Int, completion: @escaping ([ReposModel]) -> Void) {
        guard let url = URLBuilder().BuildURL(for: .user, pathParam: user, page: page) else {return}
        ApiServices.load(url: url, model: [ReposModel].self, completion: { result in
            completion(result)
        })
}
}
