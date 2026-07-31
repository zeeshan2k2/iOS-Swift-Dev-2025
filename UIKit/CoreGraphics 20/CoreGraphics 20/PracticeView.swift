//
//  PracticeView.swift
//  CoreGraphics 20
//
//  Created by Zeeshan Waheed on 31/07/2026.
//

import UIKit

class PracticeView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // gets context necessary such that we can start drawing
        // holds the state of all drawing in our core graphics application
        let context = UIGraphicsGetCurrentContext()
        
        //fill color - global context fill color
        context?.setFillColor(UIColor.orange.cgColor)
        
        //stroke color
    }

}
