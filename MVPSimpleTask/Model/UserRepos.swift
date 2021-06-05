//
//  Repos.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 21/05/2021.
//

import Foundation

struct UserRepos: Codable {
    var data: [Repo]
}

struct Repo: Codable {
    var name: String
    var stars: Int
    var language: String?
    
    enum CodingKeys: String, CodingKey {
        case language, name
        case stars = "stargazers_count"
    }
}
