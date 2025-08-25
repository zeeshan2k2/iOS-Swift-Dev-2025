//
//  NextViewController.swift
//  Navigation 7
//
//  Created by Zeeshan Waheed on 25/08/2025.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToLastVCClicked(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let lastVC = mainStoryboard.instantiateViewController(withIdentifier: "LastVC")
        navigationController?.pushViewController(lastVC, animated: true)
    }
    
    
    @IBAction func goBackBtnClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
