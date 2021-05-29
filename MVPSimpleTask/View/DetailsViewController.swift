//
//  DetailsViewController.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 18/05/2021.
//

import UIKit

protocol ReposView : AnyObject {
    func presentReposInfo()
}

class DetailsViewController: UIViewController, ReposView {
    
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    
    var delegate: ReposDetailsDelegateProtocol?
    
    var repoName: String = ""
    var stars: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = ReposDetailsPresenter(view: self)
    }
    
    func presentReposInfo() {
        repoNameLabel.text = repoName
        starsLabel.text = stars
    }
}
