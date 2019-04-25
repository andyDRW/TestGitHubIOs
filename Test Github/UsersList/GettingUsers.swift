//
//  GettingContributors.swift
//  Test Github
//
//  Created by Андрей Прокопенко on 25/04/2019.
//  Copyright © 2019 Andrey Prokopenko. All rights reserved.
//

import UIKit
import Alamofire

class GettingUsers {

    let url = "https://api.github.com/repos/ruby/ruby/contributors"
    
     func getContributors(_ success:@escaping ([GitHubUser])->(), fail:@escaping ()->Void){
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
            .responseData { response in
                if response.result.isSuccess{
                    if let data = response.data{
                        do{
                            
                            let contributors = try JSONDecoder().decode([GitHubUser].self, from: data)
                            success(contributors)
                        }catch{
                            fail()
                            print(error)
                        }
                    }
                }
                else{
                    fail()
                }
                
        }
        
    }
    
    func getUser(url:String, success:@escaping (GitHubUser)->(), fail:@escaping ()->Void){
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
            .responseData { response in
                if response.result.isSuccess{
                    if let data = response.data{
                        do{
                            let contributors = try JSONDecoder().decode(GitHubUser.self, from: data)
                            success(contributors)
                        }catch{
                            fail()
                            print(error)
                        }
                    }
                }
                else{
                    fail()
                }
                
        }
        
    }
   
}
