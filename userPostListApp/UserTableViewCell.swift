//
//  UserTableViewCell.swift
//  userPostListApp
//
//  Created by Ahmed kotb on 2/12/17.
//  Copyright © 2017 Ahmed Kotb. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func populateCellWithData(name: NSString, userName: NSString, email: NSString, address: UserAddress)
    {
        self.nameLabel.text = "Name: " + (name as String)
        self.userNameLabel.text = "UserName: " + (userName as String)
        self.emailLabel.text = "Email: " + (email as String)
        self.addressLabel.text = "Address: " + (address.street as! String) + ", " + (address.suite as! String) + ", " + (address.city as! String) + ", " + (address.zipCode as! String)
        
    }
}
