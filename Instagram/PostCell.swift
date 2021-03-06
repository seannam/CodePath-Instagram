//
//  PostCell.swift
//  Instagram
//
//  Created by Sean Nam on 3/9/17.
//  Copyright © 2017 Sean Nam. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var profileThumbnailImageView: UIImageView!
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    var post: PFObject? {
        didSet {
            self.commentLabel.text = post?["caption"] as? String
            self.usernameLabel.text = post?["author"] as? String
            
            if let postImage = post?["media"] as? PFFile {
                postImage.getDataInBackground(block: { (imageData: Data?, error: Error?) in
                    if let imageData = imageData {
                        self.postImageView.image = UIImage.init(data: imageData)
                    }
                })
            }
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
