//
//  UsersViewController.swift
//  userPostListApp
//
//  Created by Ahmed kotb on 2/12/17.
//  Copyright © 2017 Ahmed Kotb. All rights reserved.
//

import UIKit
import SVProgressHUD

class UsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, webServiceManagerDelegate {

    @IBOutlet weak var usersTableView: UITableView!
    var userList = [User]()
    var userID : NSInteger?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usersTableView.isHidden = true
        SVProgressHUD.show()
        
        let serviceManager = webServiceManager()
        serviceManager.delegate = self
        serviceManager.getUserList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Users"
    }
    
    
    // MARK:- Web Service Manager Delegate
    
    func didFinishRetrieving(sender: webServiceManager, users: [User]?, Posts: [Post]?) {
        userList = users!
        self.usersTableView.reloadData()
        SVProgressHUD.dismiss()
        self.usersTableView.isHidden = false
    }
   
    // MARK:- TableView Datasource and Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        let user : User = userList[indexPath.row]
        cell.populateCellWithData(name: user.name!, userName: user.userName!, email: user.email!, address: user.address!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user : User = userList[indexPath.row]
        self.userID = user.ID
        performSegue(withIdentifier: "UserPostsSegue", sender: self)
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the Posts view controller using segue.destinationViewController.
        if segue.identifier == "UserPostsSegue"
        {
            let postsVC : PostsViewController = segue.destination as! PostsViewController
            
            // Pass the selected object to the Posts view controller.
            
            postsVC.userID = self.userID
           
        }
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
