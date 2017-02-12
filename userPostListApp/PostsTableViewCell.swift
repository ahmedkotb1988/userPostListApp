//
//  PostsTableViewCell.swift
//  userPostListApp
//
//  Created by Ahmed kotb on 2/12/17.
//  Copyright © 2017 Ahmed Kotb. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func populateCellWithData(title: NSString, body: NSString)
    {
        self.postTitleLabel.text = "Title: " + (title as String)
        self.postBodyLabel.text = "Body : " + (body as String)
    }
}
