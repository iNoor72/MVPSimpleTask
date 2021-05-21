//
//  InformationPresenter.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 21/05/2021.
//

import Foundation
import Alamofire

protocol InfoPresenterDelegate {
    func presentInfo()
    func fetchInfo()
}

struct InformationPresenter: InfoPresenterDelegate {
  
    
    var mainView: InfoView
    
    
    
    func presentInfo() {
        
    }
    
    func fetchInfo() {
        let url = Router.userInfo
        AF.request(url).responseDecodable { (response : (DataResponse<User, AFError>)) in
            switch response.result {
            case .success(let user):
                print("User's data fetched perfectly. \(user)")
            case .failure(let error):
                print("There was a problem fetching user's data. \(error)")
            }
        }
    }
    
    
    
}
