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
    }
    
    @IBAction func segmentedControlValChanged(_ sender: UISegmentedControl) {
    }
    
}
