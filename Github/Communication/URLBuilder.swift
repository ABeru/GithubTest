//
//  URLBuilder.swift
//  Github
//
//  Created by Alexandre on 02.09.21.
//

import Foundation
class URLBuilder {
    private var url = URL(string: API.address)
    func BuildURL(for endpoint: API.Endpoints, pathParam: String) -> URL? {
        let path = API.Endpoints.user.rawValue + pathParam + API.Endpoints.repository.rawValue
        url?.appendPathComponent(path)
        return url
    }
}
