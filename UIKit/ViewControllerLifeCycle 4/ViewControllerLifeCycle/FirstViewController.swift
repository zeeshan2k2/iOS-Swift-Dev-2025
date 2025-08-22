//
//  FirstViewController.swift
//  ViewControllerLifeCycle
//
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToNextViewController), for: .touchUpInside)
        button.setTitle("Next View Controller", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    //we use the load view if we setup our views and constraints programmatically
    //do not call the super implementation and you must create the root view
    override func loadView() {
        let rootView = UIView()
        rootView.backgroundColor = UIColor.white
        rootView.addSubview(nextButton)
        nextButton.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: rootView.centerYAnchor).isActive = true
        view = rootView
    }
    
    deinit {
        print("view did deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load called")
    }
    
    //view is about to appear. bounds defined but not final
    //resumer observers or any kind of running tasks
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear called")
    }
    
    //this is called when the subViews are about to be laid
    //perfect player to change layer properties like the corner radius
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("view will layout subviews called")
    }
    
    //this is called when the subViews have been laid
    //perfect player to change layer properties like the corner radius
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("view did layout subview called")
    }
    
    //this is when the view is visible to the user
    //perfect for startintg an animation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear called")
    }
    
    //view is about to dissapear
    //stop timers or observers
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will dissapear called")
    }
    
    //view is no longer visible it has dissapeard
    //stop timers or observers
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View did dissapear called")
    }
    
    @objc func goToNextViewController() {
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        present(secondViewController, animated: true)
    }

}
