//
//  ViewController.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 18/05/2021.
//

import UIKit

protocol InfoView: AnyObject {
    var user: User? { get set }
    var repos: UserRepos? { get set }
    func presentInfo()
}

class InformationViewController: UIViewController, InfoView {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var user: User?
    var repos: UserRepos?
    
    var delegate: InfoPresenterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoCell")
        delegate = InformationPresenter(view: self)
        delegate?.fetchInfo()
        presentInfo()
    }
    
    func presentInfo() {
        userImage.image = delegate?.fetchUserImage(user: user ?? User(name: "", bio: "", imageURL: "", url: "", reposURL: "", reposCount: 0))
        usernameLabel.text = user?.name ?? "No name fetched until now"
        starsLabel.text = "\(user?.reposCount ?? 0) 📁"
    }
}

extension InformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.reposCount ?? 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoTableViewCell
        cell.repoNameLabel.text = repos?.data[indexPath.row].name ?? "No data"
        cell.starsLabel.text = "\(repos?.data[indexPath.row].stars ?? 0) ⭐️"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = storyboard?.instantiateViewController(identifier: "RepoDetails") as! DetailsViewController
        destination.repoName = repos?.data[indexPath.row].name ?? "No Repo Name"
        destination.stars = "\(repos?.data[indexPath.row].stars ?? 0) ⭐️"
        navigationController?.pushViewController(destination, animated: true)
    }
}
