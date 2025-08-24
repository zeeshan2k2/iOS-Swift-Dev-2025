
import UIKit

class EditBioViewController:UIViewController {
    
    @IBOutlet weak var bioTxtView: UITextView!
    @IBOutlet weak var submitBtn: UIButton!
    var placeHolderText = "Placeholder"
    weak var profileVC: ProfileViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bioTxtView.delegate = self
        bioTxtView.layer.borderWidth = 0.5
        bioTxtView.layer.borderColor = UIColor.lightGray.cgColor
        bioTxtView.text = placeHolderText
        bioTxtView.textColor = .lightGray
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        submitBtn.layer.cornerRadius = 5
        bioTxtView.layer.cornerRadius = 8
    }
    
    @IBAction func submitBtnClicked(_ sender: Any) {
        guard let bio = bioTxtView.text else {
           return
        }
        let userInfo: [String: Any] = ["bio": bio]
        NotificationCenter.default.post(name: updateBioNotificationKey, object: nil, userInfo: userInfo)
        dismiss(animated: true)
    }
}

extension EditBioViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.count == 0 {
            textView.textColor = .lightGray
            textView.text = placeHolderText
        }
    }
}
