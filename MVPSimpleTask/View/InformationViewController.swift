//
//  ViewController.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 18/05/2021.
//

import UIKit

protocol InfoView: AnyObject {
    func presentInfo()
}

class InformationViewController: UIViewController, InfoView {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: InfoPresenterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoCell")
        delegate = InformationPresenter(view: self)
        delegate?.fetchInfo()
    }
    
    func presentInfo() {
        //force unwrap here needs to be solved
        userImage.image = delegate?.fetchUserImage(user: (delegate?.user!)!)
        usernameLabel.text = delegate?.user?.name
    }
}

extension InformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoTableViewCell
        
        return cell
    }
}
