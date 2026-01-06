//
//  RoundedButton.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 05/01/2026.
//

import UIKit

class PillButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.font = UIFont.style(.buttonTitle)
        backgroundColor = .link
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
