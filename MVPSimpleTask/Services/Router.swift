//
//  Router.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 20/05/2021.
//

import Foundation
import Alamofire

enum Router: URLConvertible{
    
    static let baseURL = "https://api.github.com/users/"
    
    case userInfo
    case userRepos
    
    var path: String {
        switch self {
        //Pass user's id to be added to the baseURL
        
        case .userInfo:
            return "hi"
        case .userRepos:
            return "hi"
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
    
    
    
    func asURL() throws -> URL {
        let url = URL(string: Router.baseURL)!
        let request = URLRequest(url: url.appendingPathComponent(path))
        return url
    }
    
    
}
