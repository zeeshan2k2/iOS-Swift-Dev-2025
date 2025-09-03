//
//  NewTaskViewController.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 03/09/2025.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black.withAlphaComponent(0.9)
    }

}
