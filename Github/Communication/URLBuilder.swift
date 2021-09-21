//
//  URLBuilder.swift
//  Github
//
//  Created by Alexandre on 02.09.21.
//

import Foundation
class URLBuilder {
    private var address = URL(string: API.address)
    func BuildURL(for endpoint: API.Endpoints, pathParam: String, page: Int) -> URL? {
        let path = API.Endpoints.user.rawValue + pathParam + API.Endpoints.repository.rawValue + API.Endpoints.page.rawValue + "\(page)"
        let url  = URL(string: (address?.appendingPathComponent(path).absoluteString.removingPercentEncoding)! )
        return url
    }
}
