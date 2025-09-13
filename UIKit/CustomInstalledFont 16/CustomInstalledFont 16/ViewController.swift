//
//  ViewController.swift
//  CustomInstalledFont 16
//
//  Created by Zeeshan Waheed on 13/09/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // It's added but won't show in the Storyboard
        UIFont.familyNames.sorted().forEach { family in
            let names = UIFont.fontNames(forFamilyName: family).sorted()
            print("Family: \(family) — Fonts: \(names)")
        }
        
        // usage
        let font = UIFont(name: "Roboto-Black", size: 16)
    }


}

