//
//  NewTaskModalView.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 07/09/2025.
//

import UIKit

class NewTaskModalView: UIView {

    @IBOutlet private weak var descriptionTxtView: UITextView!
    @IBOutlet private weak var categoryPickerView: UIPickerView!
    @IBOutlet private weak var submitBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet private var contentView: UIView!
    var delegate: NewTasKDelegate?
    private var task: Task?
    
    var caption: String {
        get { descriptionTxtView.text }
        set { descriptionTxtView.text = newValue }
    }
    
    init(frame: CGRect, task: Task?) {
        super.init(frame: frame)
        self.task = task
        initSubviews()
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        initSubviews()
//    }
    
    // responsible for the initialization of the visual objects
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "NewTaskModalView", bundle: nil)
        nib.instantiate(withOwner: self)
        
        descriptionTxtView.delegate = self
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        titleLbl.font = UIFont.style(.h1)
        captionLbl.font = UIFont.style(.formLabel)
        categoryLbl.font = UIFont.style(.formLabel)
        submitBtn.titleLabel?.font = UIFont.style(.buttonTitle)
        descriptionTxtView.layer.borderWidth = 0.5
        descriptionTxtView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTxtView.layer.cornerRadius = 8
        
        categoryPickerView.selectRow(1, inComponent: 0, animated: false)
        
        if let task = task {
            descriptionTxtView.text = task.caption
            descriptionTxtView.textColor = .label
            if let rowIndex = Category.allCases.firstIndex(of: task.category) {
                categoryPickerView.selectRow(rowIndex, inComponent: 0, animated: false)
            }
        } else {
            descriptionTxtView.text = "Add caption..."
            descriptionTxtView.textColor = .placeholderText
            categoryPickerView.selectRow(1, inComponent: 0, animated: false)
        }
        
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    override func layoutSubviews() {
        contentView.layer.cornerRadius = 5
        
    }
    
    /*
     This is the appropriate place to change the corner radius because it will acocunt for layout changes and changes in the size of views
     */
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        print("Test to see if this is called")
//    }
    
    
    @IBAction func submitBtnClicked(_ sender: Any) {
        guard let caption = descriptionTxtView.text,
            caption.count >= 4 else {
            return
        }
        let selectedRow = categoryPickerView.selectedRow(inComponent: 0)
        let category = Category.allCases[selectedRow]
        if let task = task {
            let task = Task(id: task.id, category: category, caption: caption, createdDate: task.createdDate, isComplete: task.isComplete)
            let userInfo: [String: Task] = ["updateTask": task]
            NotificationCenter.default.post(name: NSNotification.Name("com.fullstacktuts.editTask"), object: nil, userInfo: userInfo)
        } else {
            let taskId = UUID().uuidString
            let task = Task(id: taskId, category: category, caption: caption, createdDate: Date(), isComplete: false)
            let userInfo: [String: Task] = ["newTask": task]
            NotificationCenter.default.post(name: NSNotification.Name("com.fullstacktuts.createTask"), object: nil, userInfo: userInfo)
        }
        
        delegate?.closeView()
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        delegate?.closeView()
    }
    
}


extension NewTaskModalView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .placeholderText {
            textView.text = nil
            textView.textColor = .label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Add caption..."
            textView.textColor = .placeholderText
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
