//
//  SettingsViewController.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 29/12/2025.
//

import UIKit

/// This allows the user ot change settings. The only setting available to change interface style to light, dark or system preference
class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsTitleLbl: UILabel!
    @IBOutlet weak var appThemeLbl: UILabel!
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupView() {
        settingsTitleLbl.font = UIFont.style(.h1)
        appThemeLbl.font = UIFont.style(.formLabel)
        // was causing the view to be hidden
//        modalView.transform = CGAffineTransform(scaleX: 0, y: 0)
        //we change the segmented control's selected index to the current interface style
        let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }
        if let window = window {
            switch window.overrideUserInterfaceStyle {
            case .light:
                segmentedControl.selectedSegmentIndex = 0
            case .dark:
                segmentedControl.selectedSegmentIndex = 1
            case .unspecified:
                segmentedControl.selectedSegmentIndex = 2
            @unknown default:
                segmentedControl.selectedSegmentIndex = 2
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //This animates the modal view using a scale up animation whereas it was initially set to a scale of zero in the viewDidLoad
        modalView.scaleUpAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        modalView.layer.cornerRadius = 5
    }
    
    @IBAction func dismissBtnClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func segmentedControlValChanged(_ sender: UISegmentedControl) {
        /*
         UIAplication: Our entire app is wraped around this
         WindowScenes: Responsible for our windows
         Windows
         KeyWindow
         overrideUserInterfaceStyle
         We obtain the window to change the interface style below
         */
        
        let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }
        
        if sender.selectedSegmentIndex == 0 {
            window?.overrideUserInterfaceStyle = .light
        } else if sender.selectedSegmentIndex == 1 {
            window?.overrideUserInterfaceStyle = .dark
        } else {
            window?.overrideUserInterfaceStyle = .unspecified
        }
    }
    
}
