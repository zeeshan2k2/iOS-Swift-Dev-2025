
import UIKit

class EditNameViewController: UIViewController {
    
    @IBOutlet weak var editNameTxtField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    var placeHolderTxt: String?
    //using weak to prevent strong reference cycles
    weak var profileVC: ProfileDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let placeHolderTxt = placeHolderTxt {
            editNameTxtField.placeholder = placeHolderTxt
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        submitBtn.layer.cornerRadius = 5
    }
    
    @IBAction func submitBtnClicked(_ sender: Any) {
        guard let profileVC = profileVC,
        let name = editNameTxtField.text else {
            return
        }
        profileVC.update(name: name)
        dismiss(animated: true)
    }
}
