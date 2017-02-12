//
//  webServiceManager.swift
//  userPostListApp
//
//  Created by Ahmed kotb on 2/12/17.
//  Copyright © 2017 Ahmed Kotb. All rights reserved.
//

import UIKit
import Alamofire

// MARK:- Web Service manager delegate protocol

protocol webServiceManagerDelegate : class {
    
    func didFinishRetrieving(sender: webServiceManager, users: [User]?, Posts: [Post]?)
}

class webServiceManager: NSObject {

    weak var delegate : webServiceManagerDelegate?
    var users  = [User]()
    var posts = [Post]()
    
// MARK:- Get All Users
    
    func getUserList()
    {
        Alamofire.request(USERS_URL).responseJSON { (response) in
            
            if let JSON = response.result.value
            {
                print(JSON)
                let userList : [NSDictionary] = JSON as! [NSDictionary]
                for userDictionary in userList
                {
                    let user  = User()
                    user.ID = userDictionary.object(forKey: "id") as! NSInteger?
                    user.name = userDictionary.object(forKey: "name") as! NSString?
                    user.userName = userDictionary.object(forKey: "username") as! NSString?
                    user.email = userDictionary.object(forKey: "email") as! NSString?
                    let address : NSDictionary = userDictionary.object(forKey: "address") as! NSDictionary
                    let addressObject = UserAddress()
                    user.address = addressObject.populateUserAddressWithObject(addressDictionary: address)
                    user.phone = userDictionary.object(forKey: "phone") as! NSString?
                    user.website = userDictionary.object(forKey: "website") as! NSString?
                    
                    self.users.append(user)
                }
                //fire delegate to indicate retrieval and array population are done
                self.delegate?.didFinishRetrieving(sender: self, users: self.users, Posts: nil)
            }
        }
        
    }
    
// MARK:- get User Posts
    
    func getPostsForUserWithID(ID: NSInteger)
    {
        let idString = NSString.init(format: "%d", ID)
        let postURL = POST_LIST_URL + (idString as String)
        Alamofire.request(postURL).responseJSON { (response) in
            
            if let JSON = response.result.value
            {
                let postList : [NSDictionary] = JSON as! [NSDictionary]
                
                for postDictionary in postList
                {
                    var post = Post()
                    let postID : NSInteger = postDictionary.object(forKey: "id") as! NSInteger
                    let postTitle : NSString = postDictionary.object(forKey: "title") as! NSString
                    let postBody : NSString = postDictionary.object(forKey: "body") as! NSString
                    post = post.populatePostWithData(ID: postID, postTitle: postTitle, postBody: postBody)
                    
                    self.posts.append(post)
                }
                
                self.delegate?.didFinishRetrieving(sender: self, users: nil, Posts: self.posts)
            }
            
        }
        
    }
}
