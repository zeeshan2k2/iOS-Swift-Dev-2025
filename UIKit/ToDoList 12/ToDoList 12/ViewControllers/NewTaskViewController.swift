//
//  NewTaskViewController.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 03/09/2025.
//

import UIKit

//TODO: - Move to seperate protocols class
/**
 NewTaskDelegate links to the NewTaskViewController and the NewTaskModalView. This helps the NewTaskViewController know when to dismiss when the x button is tapped on the NewTaskModalView and to present an error when a user enters invalid input
*/

protocol NewTaskDelegate: AnyObject {
    ///Dismiss the NewTaskViewController: Called when x button is tapped
    func closeView()
    
    /**
    This presents an error alert when the user enters invalid input.
     - Parameters:
         - title: This is the title of the error alert
         - message: A short description of waht went wrong
     */
    func presentErrorAlert(title: String, message: String)
}

/// This class is responsible for creating a new task
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
    
    /**
        This creates the NewTaskViewController
         - Parameters:
          - task: if a task is being edited, task should be passed, If a new task is being created, task should be nil
          - Returns: NewTakViewController with a NewTaskModalView for the user to edit or create a task.
     */
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
        view.backgroundColor = .black.withAlphaComponent(0.5)
        modalView.transform = CGAffineTransform(scaleX: 0, y: 0)
        view.addSubview(modalView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // spring with damping value less means more bouncing and vice versa
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: [.curveEaseOut]) {
            self.modalView.transform = CGAffineTransform.identity
        }
        
//        UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseOut]) {
//            self.modalView.transform = CGAffineTransform.identity
//        }
        
//        UIView.animate(withDuration: 0.25) {
//            self.modalView.transform = CGAffineTransform.identity
//        }
    }
}


//MARK: - Conformance to New Task Delegation
extension NewTaskViewController: NewTaskDelegate {
    
    func closeView() {
        dismiss(animated: true)
    }
    
    func presentErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
