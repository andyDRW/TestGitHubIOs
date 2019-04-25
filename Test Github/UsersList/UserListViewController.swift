//
//  ViewController.swift
//  Test Github
//
//  Created by Андрей Прокопенко on 25/04/2019.
//  Copyright © 2019 Andrey Prokopenko. All rights reserved.
//

import UIKit
import Kingfisher


class UserListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var selectedUser:GitHubUser?
    var githubUsers:[GitHubUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        GettingUsers().getContributors({[weak self] (users) in
            self?.githubUsers = users
            self?.tableView.reloadData()
        }) {
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ident = segue.identifier
        if ident == "ShowMap"{
            let dest = segue.destination as! UserMapViewController
            dest.user = selectedUser
        }
    }

}

extension UserListViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return githubUsers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GitHubUserCell.id, for: indexPath) as! GitHubUserCell
        let user = githubUsers[indexPath.row]
        if let avatarUrl = URL(string: user.avatarUrl ?? ""){
            cell.avatarImageView?.kf.setImage(with: avatarUrl)
        }
        cell.nameLabel.text=user.login
        cell.commitsLabel.text = "total commits:\(user.contributions!)"
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = githubUsers[indexPath.row]
        
        GettingUsers().getUser(url: user.url ?? "", success: { [weak self] (user) in
            self?.selectedUser = user
            self?.performSegue(withIdentifier: "ShowMap", sender: self)
        }) {
            
        }
    }

}
