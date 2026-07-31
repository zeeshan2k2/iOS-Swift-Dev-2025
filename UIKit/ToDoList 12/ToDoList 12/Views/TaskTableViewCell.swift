//
//  TaskTableViewCell.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 01/09/2025.
//

import UIKit

protocol TaskTableViewCellDelegate: AnyObject {
    func editTask(task: TaskModel)
    func markTask(task: TaskModel)
}

class TaskTableViewCell: UITableViewCell {

    static let identifier = "TaskTableViewCell"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var categoryContainerView: UIView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var isCompleteImgView: UIImageView!
    @IBOutlet weak var stripView: UIView!
    
    private weak var delegate: TaskTableViewCellDelegate?
    private var task: TaskModel!
    
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
    
    func configure(withTask task: TaskModel, delegate: TaskTableViewCellDelegate?) {
        let taskCategory = Category(rawValue: task.category)!
        stripView.backgroundColor = taskCategory.color
        categoryContainerView.backgroundColor = taskCategory.secondaryColor
        categoryLbl.textColor = taskCategory.color
        categoryLbl.text = taskCategory.rawValue
        captionLbl.text = task.caption
        isCompleteImgView.image = task.isComplete ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "circle")
        dateLbl.text = dateFormatter.string(from: task.createdDate)
        selectionStyle = .none
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleCompletiton))
        isCompleteImgView.addGestureRecognizer(tap)
        isCompleteImgView.isUserInteractionEnabled = true
        self.task = task
        self.delegate = delegate
    }
    
    @objc func toggleCompletiton() {
        guard let task = task else { return }
        delegate?.markTask(task: task)
    }

    @IBAction func editTaskBtnClicked(_ sender: Any) {
        guard let task = task else { return }
        
        delegate?.editTask(task: task)
    }

}
