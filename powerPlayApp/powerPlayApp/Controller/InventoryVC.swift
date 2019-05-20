//
//  InventoryVC.swift
//  powerPlayApp
//
//  Created by Stephenson Ang on 17/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class InventoryVC: UIViewController {
    
    @IBOutlet weak var inventoryTableView: UITableView!
    
    var inventory: [Inventory] = []
    
    var itemName: String!
    var itemQuantity: Int!
    var itemPrice: Double!
    
    func initData(name: String, quantity: Int, price: Double) {
        self.itemName = name
        self.itemQuantity = quantity
        self.itemPrice = price
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inventoryTableView.delegate = self
        inventoryTableView.dataSource = self
        
    }
    
    @IBAction func addItemBtnWasPressed(_ sender: Any) {
        guard let addInventoryVC = storyboard?.instantiateViewController(withIdentifier: "AddInventoryVC") as? AddInventoryVC else { return }
        presentDetail(addInventoryVC)
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
}

extension InventoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? ItemCell else { return UITableViewCell() }
        cell.configureCell(inventory: inventory[indexPath.row])
        return cell
    }
    
}
