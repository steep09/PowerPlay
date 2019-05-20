//
//  AddInventory.swift
//  powerPlayApp
//
//  Created by Stephenson Ang on 17/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import CoreData

class AddInventoryVC: UIViewController {
    
    
    @IBOutlet weak var itemNameTxtField: UITextField!
    @IBOutlet weak var itemQuantityTxtField: UITextField!
    @IBOutlet weak var itemPriceTxtField: UITextField!
    
    var itemName: String!
    var itemQuantity: Int!
    var itemPrice: Double!
    
    var inventory: [Inventory] = []
    
    func initData(name: String, quantity: Int, price: Double) {
        self.itemName = name
        self.itemQuantity = quantity
        self.itemPrice = price
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func CreateBtnWasPressed(_ sender: Any) {
        guard let inventoryVC = storyboard?.instantiateViewController(withIdentifier: "InventoryVC") as? InventoryVC else { return }
        
        inventoryVC.initData(name: itemNameTxtField.text!, quantity: Int(itemQuantityTxtField.text!) ?? 0, price: Double(itemPriceTxtField.text!) ?? 0)
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
}
