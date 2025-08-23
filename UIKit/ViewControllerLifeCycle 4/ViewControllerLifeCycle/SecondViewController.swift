//
//  SecondViewController.swift
//  ViewControllerLifeCycle
//
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var previousButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToPreviousViewController), for: .touchUpInside)
        button.setTitle("Previous View Controller", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "Second View Controller"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    override func loadView() {
        print("next load view calledddd")
        let rootView = UIView()
        rootView.backgroundColor = UIColor.white
        rootView.addSubview(previousButton)
        rootView.addSubview(titleLabel)
        previousButton.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        previousButton.centerYAnchor.constraint(equalTo: rootView.centerYAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        view = rootView
    }
    
    deinit {
        print("next did deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        print("next view did load called")
    }
    
    //view is about to appear. bounds defined but not final
    //resumer observers or any kind of running tasks
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("next view will appear called")
    }
    
    //this is called when the subViews are about to be laid
    //perfect player to change layer properties like the corner radius
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("next view will layout subviews called")
    }
    
    //this is called when the subViews have been laid
    //perfect player to change layer properties like the corner radius
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("next view did layout subview called")
    }
    
    //this is when the view is visible to the user
    //perfect for startintg an animation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("next view did appear called")
    }
    
    //view is about to dissapear
    //stop timers or observers
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("next view will dissapear called")
    }
    
    //view is no longer visible it has dissapeard
    //stop timers or observers
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("next View did dissapear called")
    }

    @objc func goToPreviousViewController() {
        dismiss(animated: true)
    }

}
