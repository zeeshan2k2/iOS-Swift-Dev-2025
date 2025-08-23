//
//  NextViewController.swift
//  ModalPresentation
//
//  Created by Zeeshan Waheed on 23/08/2025.
//

import UIKit

class NextViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("next view will appear called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("next view did appear called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("next view will disappear called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("next view did disappear called")
    }
    
    @IBAction func goToContextVC(_ sender: Any) {
        performSegue(withIdentifier: "ContextSegue", sender: nil)
    }
    
//    @IBAction func dismissVcBtnClicked(_ sender: Any) {
//        dismiss(animated: true)
//    }
}
