//
//  ViewController.swift
//  ModalPresentation
//
//  Created by Zeeshan Waheed on 23/08/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear called")
    }

    @IBAction func nextVcBtnClicked(_ sender: Any) {
        //using segue on storyboard
//        performSegue(withIdentifier: "NextSegue", sender: nil)
        
        //using main storyboard
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = mainStoryboard.instantiateViewController(withIdentifier: "NextVC")
        nextVC.modalPresentationStyle = .formSheet
        present(nextVC, animated: true)
        
        //programatically
//        let modalVC = ModalViewController()
//        modalVC.view.backgroundColor = .white
//        present(modalVC, animated: true)
    }
    
}

