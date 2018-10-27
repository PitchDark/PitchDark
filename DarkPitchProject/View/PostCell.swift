//
//  PostCell.swift
//  DarkPitchProject
//
//  Created by Sanaz Khosravi on 10/26/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet var captionText: UITextView!
    @IBOutlet var imageViewCell: UIImageView!
    var indexpath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
