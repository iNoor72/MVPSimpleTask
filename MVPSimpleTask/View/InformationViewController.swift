//
//  ViewController.swift
//  MVPSimpleTask
//
//  Created by Noor Walid on 18/05/2021.
//

import UIKit

protocol InfoView: AnyObject {
    func reloadTableView()
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
        navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoCell")
        delegate = InformationPresenter(view: self)
        delegate?.fetchUserInfo()
        delegate?.fetchUserRepos()
        presentInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func presentInfo() {
        userImage.image = delegate?.fetchUserImage(user: delegate?.user ?? User(name: "", bio: "", imageURL: "", url: "", reposURL: "", reposCount: 0))
        usernameLabel.text = delegate?.user?.name ?? "No name fetched until now"
        starsLabel.text = "\(delegate?.user?.reposCount ?? 0) 📁"
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
}

extension InformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.user?.reposCount ?? 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoTableViewCell
        cell.repoNameLabel.text = delegate?.repos?[indexPath.row].name ?? "No data"
        cell.starsLabel.text = "\(delegate?.repos?[indexPath.row].stars ?? 0) ⭐️"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = storyboard?.instantiateViewController(identifier: "RepoDetails") as! DetailsViewController
        destination.delegate?.repoName = delegate?.repos?[indexPath.row].name ?? "No Repo Name"
        destination.delegate?.stars = delegate?.repos?[indexPath.row].stars ?? 0
        navigationController?.pushViewController(destination, animated: true)
//        navigationController?.present(destination, animated: true, completion: nil)
    }
}
