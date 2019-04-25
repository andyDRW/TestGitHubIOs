//
//  GitHubUser.swift
//  Test Github
//
//  Created by Андрей Прокопенко on 25/04/2019.
//  Copyright © 2019 Andrey Prokopenko. All rights reserved.
//

import UIKit

class GitHubUser: Codable {
    var login:String?
    var id:Int?
    var avatarUrl:String?
    var url:String?
    var contributions:Int?
    var location:String?

    
    enum CodingKeys: String, CodingKey
    {
        case login = "login"
        case id = "id"
        case avatarUrl = "avatar_url"
        case url = "url"
        case contributions = "contributions"
        case location = "location"

    }
    

   
}
