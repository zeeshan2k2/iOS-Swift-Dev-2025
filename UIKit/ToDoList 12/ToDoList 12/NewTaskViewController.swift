//
//  NewTaskViewController.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 03/09/2025.
//

import UIKit

protocol NewTasKDelegate: AnyObject {
    func closeView()
}

class NewTaskViewController: UIViewController {
    
    lazy var modalView: NewTaskModalView = {
        let modalWidth = view.frame.width - CGFloat(30)
        let modalHeight: CGFloat = 410
        let frame = CGRect(x: 15, y: view.center.y - (modalHeight / 2), width: modalWidth, height: modalHeight)
        let modalView = NewTaskModalView(frame: frame, task: task)
        modalView.delegate = self
        return modalView
    }()
    
    private var task: Task?
    
    init(task: Task? = nil) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        self.task = task
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.9)
        
        view.addSubview(modalView)
    }

}


//MARK: - Conformance to New Task Delegation
extension NewTaskViewController: NewTasKDelegate {
    
    func closeView() {
        dismiss(animated: true)
    }
}
