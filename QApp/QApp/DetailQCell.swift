//
//  DetailQCell.swift
//  QApp
//
//  Created by Anuraag Jain on 13/02/17.
//  Copyright © 2017 Anuraag. All rights reserved.
//

import UIKit

class DetailQCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImg.layer.cornerRadius = profileImg.bounds.size.width/2
        profileImg.layer.masksToBounds = true
        profileImg.layer.borderColor = UIColor.white.cgColor
        profileImg.layer.borderWidth = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
