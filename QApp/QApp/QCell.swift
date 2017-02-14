//
//  QCell.swift
//  QApp
//
//  Created by Anuraag Jain on 10/02/17.
//  Copyright © 2017 Anuraag. All rights reserved.
//

import UIKit

class QCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 4.0
        cardView.layer.masksToBounds = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
