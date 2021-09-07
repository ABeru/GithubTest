//
//  ApiServices.swift
//  Github
//
//  Created by Alexandre on 02.09.21.
//

import Foundation
import Alamofire
final class ApiServices {
    static func load<T: Decodable>(url: URL, model: T.Type, completion: @escaping (T) -> Void) {
        AF.request(url).responseDecodable(of: model) { result in
            guard let res = result.value else {return}
            completion(res)
            
        }
}
}
