//
//  ReposDetailsPresenter.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 29/05/2021.
//

import Foundation

protocol ReposDetailsDelegateProtocol {
    func presentReposInfo()
    func fetchReposInfo()
}

class ReposDetailsPresenter: ReposDetailsDelegateProtocol {
    weak var reposView: ReposView?
    
    init(view: ReposView) {
        self.reposView = view
    }
    
    func fetchReposInfo() {
        let url = Router.userRepos
    }
    
    
    
    func presentReposInfo() {
        reposView?.presentReposInfo()
    }
    
}
