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
    var user: User? {get}
    func presentInfo()
    func fetchInfo()
    func fetchUserImage(user: User) -> UIImage
}

class InformationPresenter: InfoPresenterDelegate {
    weak var mainView: InfoView?
    var user: User?
    
    init(view: InfoView) {
        self.mainView = view
    }
    
    func presentInfo() {
        mainView?.presentInfo()
    }
    
    func fetchInfo() {
        let url = Router.userInfo
        AF.request(url).responseDecodable { [weak self] (response : (DataResponse<User, AFError>)) in
            switch response.result {
            case .success(let userInfo):
                //This line is for SwiftyJSON
                //let json = JSON(userInfo)
                self?.user = userInfo
                self?.fetchUserImage(user: userInfo)
                print("User's data fetched perfectly. \(userInfo)")
            case .failure(let error):
                print("There was a problem fetching user's data. \(error)")
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
