//
//  NextViewController.swift
//  ViewControllerLifeCycle
//
//

import UIKit

class NextViewController: UIViewController {
    
    deinit {
        print("next vc did deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backToPreviousViewController(_ sender: Any) {
        dismiss(animated: true)
    }
    

}
