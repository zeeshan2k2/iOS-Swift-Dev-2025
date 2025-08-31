//
//  ViewController.swift
//  TableView 10
//
//  Created by Zeeshan Waheed on 31/08/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var shoppingItems: [String] = ["Apples", "Bananas", "Oranges"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

//MARK: - TableView Datasource Methods
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell")
        var content = cell?.defaultContentConfiguration()
        content?.text = shoppingItems[indexPath.row]
        cell?.contentConfiguration = content
        return cell!
    }
}

//MARK: - TableView Delegate Methods
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
