//
//  ViewController.swift
//  CABasicAnimation
//
//  Created by Zeeshan Waheed on 02/01/2026.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var exampleView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.frame = CGRect(x: 0, y: self.view.center.y - 60, width: 100, height: 100)
        return view
    }()

    lazy var startButton: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.center.x - 50, y: self.view.frame.height - 80, width: 100, height: 60))
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(startAnimating), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(exampleView)
        view.addSubview(startButton)
    }

    @objc func startAnimating() {
        let basicAnimation = CABasicAnimation(keyPath: "position.x")
        
        // only two must be used
        
        // animation starts
        basicAnimation.fromValue = exampleView.frame.width / 2
        
        // animation start + byvalue -> relative to start value
        // basicAnimation.byValue = 250.0
        
        // animation ends -> absolute value
        basicAnimation.toValue = 250.0
        
        // 0.25 default value internally
        basicAnimation.duration = 1.0
        
        // case 1: where we just set the completion to false
//        basicAnimation.isRemovedOnCompletion = false
        
        //case 2
        exampleView.layer.setValue("anything", forKey: "something")
        
        
        basicAnimation.beginTime = CACurrentMediaTime() + 1.0
        
        basicAnimation.delegate = self
        
        // key adds an identifer to each animation
        exampleView.layer.add(basicAnimation, forKey: "basic")
    }

}

extension ViewController: CAAnimationDelegate {
    
    func animationDidStart(_ anim: CAAnimation) {
        // remember to use this when the animation starts else the view will change position the go to initial position and animate to end position
        exampleView.layer.position.x = 250.0
        
//        print("Start")
//        print("presentation layer \(String(describing: exampleView.layer.presentation()))")
    }
    
    // flag -> indicates whether the animation has stopped or not
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        if flag {
//            case 1: where we have to set basicAnimation.isRemovedOnCompletion = false
//            if anim == exampleView.layer.animation(forKey: "basic") {
//                print("Success")
//            }
            
//            case 2
            guard let theKey = exampleView.layer.value(forKey: "something") as? String else { return }
            print(theKey)
            
            
//            print("Stop")
//            print("model layer \(exampleView.layer.model())")
//            print("presentation layer \(String(describing: exampleView.layer.presentation()))")
        }
    }
    
}

