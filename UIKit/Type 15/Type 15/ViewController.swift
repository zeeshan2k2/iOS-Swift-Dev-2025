//
//  ViewController.swift
//  Type 15
//
//  Created by Zeeshan Waheed on 12/09/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headlineTxtLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dynamic Font
        let arialFont = UIFont(name: "Arial", size: UIFont.labelFontSize)!
        headlineTxtLbl.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: arialFont)
        headlineTxtLbl.adjustsFontForContentSizeCategory = true
    }


}

