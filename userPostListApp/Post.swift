//
//  Post.swift
//  userPostListApp
//
//  Created by Ahmed kotb on 2/12/17.
//  Copyright © 2017 Ahmed Kotb. All rights reserved.
//

import UIKit

class Post: NSObject {

    var postID : NSInteger?
    var title : NSString?
    var body : NSString?
    
    func populatePostWithData(ID: NSInteger, postTitle: NSString, postBody: NSString) -> Post
    {
        self.postID = ID
        self.title = postTitle
        self.body = postBody
        
        return self
    }
}
