//
//  ViewController.swift
//  TableViewController 9
//
//  Created by Zeeshan Waheed on 29/08/2025.
//

import UIKit

class ShoppingItem {
    let title: String
    let subTitle: String
    var isSelected = false
    
    init(title: String, subTitle: String, isSelected: Bool = false) {
        self.title = title
        self.subTitle = subTitle
        self.isSelected = isSelected
    }
}

class ViewController: UITableViewController {
    
    var shoppingItems: [ShoppingItem] = [
        ShoppingItem(title: "Eggs", subTitle: "Buy 6 eggs"),
        ShoppingItem(title: "Apples", subTitle: "Red apples only"),
        ShoppingItem(title: "Bananas", subTitle: "Buy as many as you can")
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShoppingItemDetailSegue" {
            let destinationVC = segue.destination as! ShoppingDetailViewController
            let shoppingItem = sender as! ShoppingItem
            destinationVC.shoppingItem = shoppingItem
        }
    }
    
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
        return shoppingItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingSubtitleCell", for: indexPath)
        let shoppingItem = shoppingItems[indexPath.row]
        
        if #available(iOS 14, *) {
            var content = cell.defaultContentConfiguration()
            content.text = shoppingItem.title
            content.secondaryText = shoppingItem.subTitle
            content.image = shoppingItem.isSelected ? UIImage(systemName: "star.fill")! : UIImage(systemName: "star")!
            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = shoppingItem.title
            cell.detailTextLabel?.text = shoppingItem.subTitle
            cell.imageView?.image = shoppingItem.isSelected ? UIImage(systemName: "star.fill")! : UIImage(systemName: "star")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did tap row")
//        var shoppingItem = shoppingItems[indexPath.row]
//        shoppingItem.isSelected = !shoppingItem.isSelected
//        tableView.reloadData()
        
        var shoppingItem = shoppingItems[indexPath.row]
        performSegue(withIdentifier: "ShoppingItemDetailSegue", sender: shoppingItem)
        
    }
}
