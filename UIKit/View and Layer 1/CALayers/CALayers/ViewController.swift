//
//  ViewController.swift
//  CALayers
//
//  Created by Zeeshan Waheed on 16/08/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var practiceView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let practiceViewWidth = CGFloat(200)
        let xPos = view.frame.width / 2 - practiceViewWidth / 2
        let yPos = view.frame.height / 2 - practiceViewWidth / 2
        practiceView.frame = CGRect(x: xPos, y: yPos, width: practiceViewWidth, height: practiceViewWidth)
        
        
        practiceView.layer.backgroundColor = UIColor.systemBlue.cgColor
        practiceView.layer.cornerRadius = 5
//        practiceView.alpha = 0.5
//        practiceView.layer.opacity = 0.5
        
        practiceView.layer.borderWidth = 5
        practiceView.layer.borderColor = UIColor.systemYellow.cgColor
        
        // for shadows
        practiceView.layer.shadowOpacity = 0.4
        practiceView.layer.shadowRadius = 15.0
//        practiceView.layer.shadowOffset = CGSize(width: -15, height: 15)
    }


}

