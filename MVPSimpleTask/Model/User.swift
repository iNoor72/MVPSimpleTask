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
    var avatar_url: String
    var url: String
    var repos_url: String
    var public_repos: Int
}
