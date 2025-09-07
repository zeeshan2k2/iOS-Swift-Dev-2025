//
//  NewTaskModalView.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 07/09/2025.
//

import UIKit

class NewTaskModalView: UIView {

    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        descriptionTxtView.delegate = self
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        
        descriptionTxtView.layer.borderWidth = 0.5
        descriptionTxtView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTxtView.layer.cornerRadius = 8
        descriptionTxtView.text = "Add caption..."
        descriptionTxtView.textColor = .lightGray
        
        categoryPickerView.selectRow(1, inComponent: 0, animated: false)
        
        layer.cornerRadius = 5
    }
    
    
    @IBAction func submitBtnClicked(_ sender: Any) {
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
    }
    
}


extension NewTaskModalView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Add caption..."
        }
    }
}


extension NewTaskModalView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Category.allCases.count
    }
    
}


extension NewTaskModalView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let category = Category.allCases[row]
        return category.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = view as? UILabel
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            pickerLabel?.textAlignment = .center
        }
        let category = Category.allCases[row]
        pickerLabel?.text = category.rawValue
        return pickerLabel!
    }
}
