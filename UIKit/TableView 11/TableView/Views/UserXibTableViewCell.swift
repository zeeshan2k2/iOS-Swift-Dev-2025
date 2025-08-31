//
//  UserXibTableViewCell.swift
//  TableView
//
//  Created by Zeeshan Waheed on 31/08/2025.
//

import UIKit

class UserXibTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var bioLbl: UILabel!
    
    let identifier = "UserXibTableViewCell"
    
    func configure(user: UserModel) {
        nameLbl.text = user.name
        avatarImgView.image = user.avatar
        bioLbl.text = user.bio
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
