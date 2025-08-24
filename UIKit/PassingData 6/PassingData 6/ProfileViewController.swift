
import UIKit

protocol ProfileDelegate: AnyObject {
    func update(name: String)
}

let updateBioNotificationKey = Notification.Name("com.fullstacktuts.updatedBioKey")

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var bioLbl: UILabel!
    @IBOutlet weak var seperatorView: UIView!
    var currentName = "Anonymous"
    var currentBio = "My first bio"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateBio(_:)), name: updateBioNotificationKey, object: nil)
    }
    
    @objc func updateBio(_ notification: Notification) {
        if let userInfo = notification.userInfo,
           let bio = userInfo["bio"] as? String {
           currentBio = bio
           bioLbl.text = bio
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        seperatorView.layer.cornerRadius = seperatorView.frame.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditNameSegue" {
            let destinationVC = segue.destination as! EditNameViewController
            destinationVC.placeHolderTxt = currentName
            destinationVC.profileVC = self
        }
//        else if segue.identifier == "EditBioSegue" {
//            let destinationVC = segue.destination as! EditBioViewController
//            destinationVC.placeHolderText = currentBio
//            destinationVC.profileVC = self
//        }
    }
    
    @IBAction func editNameBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "EditNameSegue", sender: nil)
    }
    
    @IBAction func editBioBtnClicked(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let editBioVC = mainStoryboard.instantiateViewController(withIdentifier: "EditBioVC") as! EditBioViewController
        editBioVC.placeHolderText = currentBio
        present(editBioVC, animated: true)
    }
}


extension ProfileViewController: ProfileDelegate {
    func update(name: String) {
        nameLbl.text = name
        currentName = name
    }
}
