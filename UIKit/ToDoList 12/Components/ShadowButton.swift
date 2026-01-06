//
//  RoundedButton.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 05/01/2026.
//

import UIKit

//Optional: @IBDesignable is depriciated
@IBDesignable
class ShadowButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 5 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    var background: UIColor = .link {
        didSet {
            backgroundColor = backgroundColor
        }
    }
    
    var shadowColor: UIColor = .red {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    override func prepareForInterfaceBuilder() {
        titleLabel?.font = UIFont.style(.buttonTitle)
        backgroundColor = background
        layer.masksToBounds = false
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
        //UPDATE: IBDesignables is depriciated so this won't work
        // IBDesignables doesnt work well with static linking
        // i.e UIColor.secondaryLink.cgColor
//        layer.shadowColor = UIColor(named: "secondaryLink")?.cgColor
        
        layer.shadowColor = shadowColor.cgColor
    }
}
