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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = ReposDetailsPresenter(view: self)
    }
    
    
    func presentReposInfo() {
        repoNameLabel.text = delegate?.repoName ?? "No name passed."
        starsLabel.text = "\(delegate?.stars ?? 0)" ?? "No stars"
    }
}
