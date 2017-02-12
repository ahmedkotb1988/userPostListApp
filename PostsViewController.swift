//
//  PostsViewController.swift
//  userPostListApp
//
//  Created by Ahmed kotb on 2/12/17.
//  Copyright © 2017 Ahmed Kotb. All rights reserved.
//

import UIKit
import SVProgressHUD

class PostsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, webServiceManagerDelegate{

    @IBOutlet weak var postsTableView: UITableView!
    
    var userID : NSInteger? // passed from users' view
    var postList = [Post]() // Will be populated from the web service
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.postsTableView.isHidden = true
        SVProgressHUD.show()
        let serviceManager = webServiceManager()
        serviceManager.delegate = self
        
        serviceManager.getPostsForUserWithID(ID: self.userID!)
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Posts"
    }
    
   
    
    // MARK:- Web Service Manager Delegate
    
    func didFinishRetrieving(sender: webServiceManager, users: [User]?, Posts: [Post]?) {
        
        self.postList = Posts!
        self.postsTableView.reloadData()
        SVProgressHUD.dismiss()
        self.postsTableView.isHidden = false
    }
    
    // MARK:- TableView Datasource and Delegate
    
    func  numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : PostsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "postsCell", for: indexPath) as! PostsTableViewCell
        
        let userPost : Post = postList[indexPath.row]
        
        cell.populateCellWithData(title: userPost.title!, body: userPost.body!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
