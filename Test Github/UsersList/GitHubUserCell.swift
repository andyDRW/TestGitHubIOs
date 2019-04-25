//
//  GihHubUserCell.swift
//  Test Github
//
//  Created by Андрей Прокопенко on 25/04/2019.
//  Copyright © 2019 Andrey Prokopenko. All rights reserved.
//

import UIKit

class GitHubUserCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commitsLabel: UILabel!
    static let id = "GitHubUserCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
