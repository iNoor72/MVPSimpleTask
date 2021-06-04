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
    func presentReposInfo()
}

class ReposDetailsPresenter: ReposDetailsDelegateProtocol {
    var repoName: String?
    var stars: Int?
    
    weak var reposView: ReposView?
    
    init(view: ReposView) {
        self.reposView = view
    }
    
    func presentReposInfo() {
        reposView?.presentReposInfo()
    }
    
}
