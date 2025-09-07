//
//  NewTaskViewController.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 03/09/2025.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    lazy var modalView: NewTaskModalView = {
        let modalView = UINib(nibName: "NewTaskModalView", bundle: nil).instantiate(withOwner: nil).first as! NewTaskModalView
        return modalView
    }()
    
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
        
        view.addSubview(modalView)
        let modalWidth = view.frame.width - CGFloat(30)
        let modalHeight: CGFloat = 410
        modalView.frame = CGRect(x: 15, y: view.center.y - (modalHeight / 2), width: modalWidth, height: modalHeight)
    }

}
