//
//  ViewController.swift
//  StudentDatabaseApp
//
//  Created by Zeeshan Waheed on 16/08/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentNamesLbl: UILabel!
    @IBOutlet weak var studentNameTxtField: UITextField!
    @IBOutlet weak var searchStudentNameTxtField: UITextField!
    @IBOutlet weak var searchForStudentLbl: UILabel!
    var students: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentNamesLbl.text = ""
        studentNamesLbl.frame = CGRect(x: 14, y: 89, width: view.frame.width - 31, height: studentNamesLbl.frame.height * 3)
    }
    
    @IBAction func searchStudentNameTapped(_ sender: Any) {
        guard let studentName = searchStudentNameTxtField.text,
            studentName != "",
            studentName.count >= 3 else {
            return
        }
        
        searchForStudentLbl.text = "Searching for \(studentName)..."
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            
            guard let studentExistsBool = self.students.firstIndex(of: studentName) else {
                self.searchForStudentLbl.text = "\(studentName) not found :("
                return
            }
            
            self.searchForStudentLbl.text = "\(studentName) found!"
        })
    }

    
    @IBAction func submitBtnTapped(_ sender: Any) {
        guard let studentName = studentNameTxtField.text,
            studentName != "",
            studentName.count >= 3 else {
            return
        }
        students.append(studentName)
        var interimStudents = ""
        for student in students {
            interimStudents += " \(student)"
        }
        studentNamesLbl.text = interimStudents
        studentNameTxtField.text = nil
        print(students.count)
    }
    
}

