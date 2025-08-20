//
//  ViewController.swift
//  ViewsAndLayers
//
//  Created by Zeeshan Waheed on 11/08/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var testButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func firstButton(_ sender: Any) {
        testButton.setTitle("Button Clicked!", for: .normal)
        print("Button has been clicked and the view color has been changed")
        firstView.backgroundColor = .red
        let xPos = view.frame.width - firstView.frame.width
        firstView.frame.origin = CGPoint(x: xPos, y: 0)
    }
    
}

