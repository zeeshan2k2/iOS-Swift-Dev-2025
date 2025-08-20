//
//  ViewController.swift
//  LoginForm
//
//  Created by Zeeshan Waheed on 12/08/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var loginStatusLbl: UILabel!
    let expectedUsername = "zeeshan"
    let expectedPassword = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginStatusLbl.text = ""
    }
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        guard let username = usernameTxtField.text else {
            return
        }
        guard let password = passwordTxtField.text else {
            return
        }
        
        if username == expectedUsername && password == expectedPassword {
            loginStatusLbl.text = "Login Success!"
            loginStatusLbl.textColor = .green
            print("Login Success!")
        } else {
            var message = ""
            
            if username != expectedUsername && password != expectedPassword {
                message = "Username and Password are Incorrect!"
            } else if username != expectedUsername {
                message = "Username is Incorrect!"
            } else if password != expectedPassword {
                message = "Password is Incorrect!"
            }
            
            loginStatusLbl.text = message
            loginStatusLbl.textColor = .red
            
            print(message)
        }
    }
    
}

