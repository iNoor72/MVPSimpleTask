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
    var stargazers_count: Int
}
