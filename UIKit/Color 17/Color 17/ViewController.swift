//
//  ViewController.swift
//  Color 17
//
//  Created by Zeeshan Waheed on 19/09/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myBlueColor = UIColor(red: 142/255, green: 187/255, blue: 255/255, alpha: 1)
        let myHSBColor = UIColor(hue: 212/360, saturation: 77/100, brightness: 1, alpha: 1)
        let hexColor = UIColor(hex: "#F5A623", alpha: 1)
        let customColor = UIColor(named: "Secondary")
        
        customView.backgroundColor = customColor
    }


}

