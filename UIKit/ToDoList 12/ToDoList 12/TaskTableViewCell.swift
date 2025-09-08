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
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var isCompleteImgView: UIImageView!
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8
        categoryContainerView.layer.cornerRadius = categoryContainerView.frame.height / 2
        
    }
    
    func configure(withTask task: Task) {
        categoryLbl.text = task.category.rawValue
        captionLbl.text = task.caption
        isCompleteImgView.image = task.isComplete ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
        dateLbl.text = dateFormatter.string(from: task.createdDate)
        selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
