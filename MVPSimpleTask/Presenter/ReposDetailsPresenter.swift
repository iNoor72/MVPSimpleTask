//
//  ReposDetailsPresenter.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 29/05/2021.
//

import Foundation
import Alamofire

protocol ReposDetailsDelegateProtocol {
    var repoName: String? { get set }
    var stars: Int? { get set }
    var language: String? { get set }
}

class ReposDetailsPresenter: ReposDetailsDelegateProtocol {
    
    var repoName: String?
    var stars: Int?
    var language: String?
    
    weak var reposView: ReposView?
    
    init(view: ReposView, repoName: String, stars: Int, language: String) {
        self.reposView = view
        self.repoName = repoName
        self.stars = stars
        self.language = language
    }
    
}
