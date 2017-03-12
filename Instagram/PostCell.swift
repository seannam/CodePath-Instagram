//
//  PostCell.swift
//  Instagram
//
//  Created by Sean Nam on 3/9/17.
//  Copyright © 2017 Sean Nam. All rights reserved.
//

import UIKit
import Parse

class PostCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var profileThumbnailImageView: UIImageView!
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    var post: PFObject? {
        didSet {
            //self.usernameLabel.text = post?.username
            //self.commentLabel.text = post?.comment
            //self.postImageView.image = post?.postImage
            print(post?["comment"]!)
        }
    }
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
