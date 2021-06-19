//
//  InformationPresenter.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 21/05/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol InfoPresenterDelegate {
    var user: User? { get set }
    var repos: [Repo]? { get set }
    func fetchUserInfo()
    func fetchUserRepos()
    func fetchUserImage(user: User) -> UIImage
}

class InformationPresenter: InfoPresenterDelegate {
    
    weak var mainView: InfoView?
    var user: User?
    var repos: [Repo]?
    
    init(view: InfoView) {
        self.mainView = view
    }
    
    func fetchUserInfo() {
        let userURL = Router.userInfo
        AF.request(userURL).responseDecodable { [weak self] (response : (DataResponse<User, AFError>)) in
            switch response.result {
            case .success(let userInfo):
                //This line is for SwiftyJSON
                //let json = JSON(userInfo)
                self?.user = userInfo
                //self?.fetchUserImage(user: userIn.fo)
                self?.mainView?.presentInfo()
                print("User's data fetched perfectly. \(userInfo)")
            case .failure(let error):
                print("There was a problem fetching user's data. \(error.localizedDescription)")
            }
        }
    }
    
    //MARK:- Fetching Repos
    
    func fetchUserRepos() {
        let reposURL = "https://api.github.com/users/iNoor72/repos"
        AF.request(reposURL).responseDecodable { [weak self] (response : (DataResponse<[Repo], AFError>)) in
            switch response.result {
            case .success(let userRepos):
                print("Fetched usere's repos successfully.\(userRepos)")
                self?.repos = userRepos
                DispatchQueue.main.async {
                    self?.mainView?.reloadTableView()
                }
            case .failure(let error):
                print("There was an error fetching the user's repos. \(error.localizedDescription)")
            }
        }
    }
    
    func fetchUserImage(user: User) -> UIImage {
        //Use alamofire to fetch the user's image using the image url sent from the API call
        //then, return the image so it can be used in the View Layer.
        var image = UIImage()
        return image
    }
    
    
    
}
