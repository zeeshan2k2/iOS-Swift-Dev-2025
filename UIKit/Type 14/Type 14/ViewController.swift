//
//  ViewController.swift
//  Type 14
//
//  Created by Zeeshan Waheed on 12/09/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fontLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        fontLbl.font = UIFont.systemFont(ofSize: 10, weight: .black)
        
        let fontDescriptor = UIFont.systemFont(ofSize: 24, weight: .medium).fontDescriptor
        if let serifDescriptor = fontDescriptor.withDesign(.serif) {
            let newYorkFont = UIFont(descriptor: serifDescriptor, size: 0.0) // size 0.0 keeps the original size
            fontLbl.font = newYorkFont
        }
    }
}

