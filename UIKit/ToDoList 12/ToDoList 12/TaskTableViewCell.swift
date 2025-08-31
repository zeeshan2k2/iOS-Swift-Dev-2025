//
//  TaskTableViewCell.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 01/09/2025.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    static let identifier = "TaskTableViewCell"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var categoryContainerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8
        categoryContainerView.layer.cornerRadius = categoryContainerView.frame.height / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
