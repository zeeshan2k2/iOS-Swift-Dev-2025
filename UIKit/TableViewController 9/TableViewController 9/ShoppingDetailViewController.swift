//
//  ShoppingDetailViewController.swift
//  TableViewController 9
//
//  Created by Zeeshan Waheed on 30/08/2025.
//

import UIKit

class ShoppingDetailViewController: UIViewController {

    @IBOutlet weak var detailLbl: UILabel!
    var shoppingItem: ShoppingItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let shoppingItem = shoppingItem {
            detailLbl.text = shoppingItem.subTitle
        }
    }
}
