//
//  ViewController.swift
//  Navigation 7
//
//  Created by Zeeshan Waheed on 25/08/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToNextVC(_ sender: Any) {
//        performSegue(withIdentifier: "NextVCSegue", sender: nil)
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = mainStoryboard.instantiateViewController(withIdentifier: "NextVC")
//        navigationController?.pushViewController(nextVC, animated: true)
        let navVC = UINavigationController(rootViewController: nextVC)
        present(navVC, animated: true)
    }
    
}

