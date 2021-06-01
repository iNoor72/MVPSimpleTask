//
//  Repos.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 21/05/2021.
//

import Foundation

struct UserRepos: Codable {
    var data: [Repos]
}

struct Repos: Codable {
    var name: String
    var repoURL: String
    var stars: Int
    var language: String
    
    enum CodingKeys: String, CodingKey {
        case repoURL = "full_name"
        case name, language
        case stars = "stargazers_count"
    }
}
