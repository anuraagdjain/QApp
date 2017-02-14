//
//  ProfileHeader.swift
//  QApp
//
//  Created by Anuraag Jain on 10/02/17.
//  Copyright © 2017 Anuraag. All rights reserved.
//

import UIKit

class ProfileHeader: UIView {

    @IBOutlet weak var profileImg:UIImageView!
    
    override func awakeFromNib() {
        profileImg.layer.cornerRadius = profileImg.bounds.width/2
        profileImg.layer.borderColor = UIColor.white.cgColor
        profileImg.layer.borderWidth = 1
    }
    class func loadView() -> ProfileHeader{
        let profileHeader = Bundle.main.loadNibNamed("ProfileHeader", owner: self, options: nil)?.first as! ProfileHeader
        return profileHeader
    }
    
    
    class func loadView(frame:CGRect) -> ProfileHeader{
        let profileHeader = Bundle.main.loadNibNamed("ProfileHeader", owner: self, options: nil)?.first as! ProfileHeader
        profileHeader.frame = frame
        return profileHeader
    }
    
}
