//
//  SettingsViewController.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 29/12/2025.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsTitleLbl: UILabel!
    @IBOutlet weak var appThemeLbl: UILabel!
    @IBOutlet weak var modalView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsTitleLbl.font = UIFont.style(.h1)
        appThemeLbl.font = UIFont.style(.formLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        modalView.layer.cornerRadius = 5
    }
    
    @IBAction func dismissBtnClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func segmentedControlValChanged(_ sender: UISegmentedControl) {
        // UIAplication: Our entire app is wraped around this
        // WindowScenes: Responsible for our windows
        // Windows
        // KeyWindow
        // overrideUserInterfaceStyle
        
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
