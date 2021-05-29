//
//  User.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 21/05/2021.
//

import Foundation

struct User: Codable {
    var name: String
    var bio: String
    var imageURL: String
    var url: String
    var reposURL: String
    var reposCount: Int
    
    enum CodingKeys: String, CodingKey {
        case name, url, bio
        case imageURL = "avatar_url"
        case reposURL = "repos_url"
        case reposCount = "public_repos"
    }
}
