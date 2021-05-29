//
//  DetailsViewController.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 18/05/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    
    var repoName: String = ""
    var stars: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repoNameLabel.text = repoName
        starsLabel.text = stars
        
    }
}
