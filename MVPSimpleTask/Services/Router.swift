//
//  Router.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 20/05/2021.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible{
    
    static let baseURL = "https://api.github.com/users"
    
    case userInfo
    case userRepos
    
    var path: String {
        switch self {
        case .userInfo:
            return "/iNoor72"
        case .userRepos:
            return "/iNoor72/repos"
        }
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .userInfo:
            return .get
        case .userRepos:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Router.baseURL)!
        let request = URLRequest(url: url.appendingPathComponent(path))
        return request
    }
    
}
