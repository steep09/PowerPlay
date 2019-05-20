//
//  ItemCell.swift
//  powerPlayApp
//
//  Created by Stephenson Ang on 17/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import CoreData

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    func configureCell(inventory: Inventory) {
        self.itemName.text = inventory.itemName
        self.itemQuantity.text = String(inventory.itemQuantity)
        self.itemPrice.text = String(inventory.itemPrice)
    }
    
}
