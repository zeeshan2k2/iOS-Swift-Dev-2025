//
//  ViewController.swift
//  TableView
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var users: [UserModel] = [
        UserModel(avatar: UIImage(systemName: "person")!, name: "James Gosling", bio: "Avid programmer"),
        UserModel(avatar: UIImage(systemName: "person")!, name: "Dennis Ritchie", bio: "Softwarae developer with lots of experiecnce with mobile applications. I have worked freelance and have worked in couple of Fortune 100 companies."),
        UserModel(avatar: UIImage(systemName: "person")!, name: "Alan Turing", bio: "Enjoys playing football and meeting with friends on weekends")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        //setup with xib table view cell
        let nib = UINib(nibName: "UserXibTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UserXibTableViewCell().identifier)
        
        //setup with programmatic table view cell
        tableView.register(ProgramaticTableViewCell.self, forCellReuseIdentifier: ProgramaticTableViewCell.identifier)
        
        //dynamic height of tableview row
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableView.automaticDimension
    }

}

//MARK: - Tableview Datasource Methods
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: UserXibTableViewCell().identifier, for: indexPath) as! UserXibTableViewCell
        cell.configure(user: user)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
      //cant use this when we're using dynamic row height (tableView.rowHeight = UITableView.automaticDimension) because the below code will be preffered and override the previous code
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
//    }
}



