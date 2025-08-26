//
//  ViewController.swift
//  KeyboardLayout 9
//
//  Created by Zeeshan Waheed on 26/08/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapEvent = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        contentView.addGestureRecognizer(tapEvent)
        contentView.isUserInteractionEnabled = true
    }
    
    @objc func dismissKeyboard() {
        //to close any active keyboards
        view.endEditing(true)
    }


}

