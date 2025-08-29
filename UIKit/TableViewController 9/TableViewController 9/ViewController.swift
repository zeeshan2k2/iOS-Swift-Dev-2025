//
//  ViewController.swift
//  TableViewController 9
//
//  Created by Zeeshan Waheed on 29/08/2025.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
        //        for multiple sections
        //        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        for sections
        //        if section == 0 {
        //            return 1
        //        }
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingSubtitleCell", for: indexPath)
        
        if #available(iOS 14, *) {
            var content = cell.defaultContentConfiguration()
            content.text = "Shopping Subtitle Item"
            content.secondaryText = "Shopping Subtitle  Description"
            content.image = UIImage(systemName: "star.fill")
            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = "Shopping Subtitle Item"
            cell.detailTextLabel?.text = "Shopping Subtitle  Description"
            cell.imageView?.image = UIImage(systemName: "star.fill")
        }
        return cell
        
        //        if indexPath.row % 2 == 0 {
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingBasicCell", for: indexPath)
        //            cell.textLabel?.text = "Shopping Basic Item"
        //            cell.detailTextLabel?.text = "Shopping Basic  Description"
        //            cell.imageView?.image = UIImage(systemName: "star")
        //            return cell
        //        }
        //        // improves performance and best practice
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingSubtitleCell", for: indexPath)
        //        cell.textLabel?.text = "Shopping Subtitle Item"
        //        cell.detailTextLabel?.text = "Shopping Subtitle  Description"
        //        cell.imageView?.image = UIImage(systemName: "star.fill")
        //        return cell
    }
}
