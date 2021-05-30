//
//  ReposDetailsPresenter.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 29/05/2021.
//

import Foundation
import Alamofire

protocol ReposDetailsDelegateProtocol {
    func presentReposInfo()
}

class ReposDetailsPresenter: ReposDetailsDelegateProtocol {
    weak var reposView: ReposView?
    
    init(view: ReposView) {
        self.reposView = view
    }
    
    func presentReposInfo() {
        reposView?.presentReposInfo()
    }
    
}
