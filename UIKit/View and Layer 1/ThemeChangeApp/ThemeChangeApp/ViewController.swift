//
//  ViewController.swift
//  ThemeChangeApp
//
//  Created by Zeeshan Waheed on 16/08/2025.
//

import UIKit

class ViewController: UIViewController {
    
    enum Theme {
        case red, yellow, blue
    }
    
    @IBOutlet var currentThemeColorLbl: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        changeTheme(theme: .blue)
    }

    @IBAction func blueButtonTapped(_ sender: Any) {
        changeTheme(theme: .blue)
    }

    @IBAction func redButtonTapped(_ sender: Any) {
        changeTheme(theme: .red)
    }
    
    @IBAction func yellowButtonTapped(_ sender: Any) {
        changeTheme(theme: .yellow)
        
    }
    
    func changeTheme(theme: Theme) {
        switch theme {
        case .blue:
            view.backgroundColor = .blue
        case .red:
            view.backgroundColor = .red
        case .yellow:
            view.backgroundColor = .yellow
        }
        
        currentThemeColorLbl?.text = "\(theme)"
    }
}

