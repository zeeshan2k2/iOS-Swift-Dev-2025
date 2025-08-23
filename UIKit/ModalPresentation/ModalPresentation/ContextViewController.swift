//
//  ContextViewController.swift
//  ModalPresentation
//
//  Created by Zeeshan Waheed on 23/08/2025.
//

import UIKit

class ContextViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("context view will appear called")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("context view did appear called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("context view will disappear called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("context view did disappear called")
    }
    
        @IBAction func dismissVcBtnClicked(_ sender: Any) {
            dismiss(animated: true)
        }
}
