//
//  InventoryVC.swift
//  powerPlayApp
//
//  Created by Stephenson Ang on 17/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import CoreData

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
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Inventory>(entityName: "Inventory")
        
        do {
            inventory = try manageContext.fetch(fetchRequest)
            completion(true)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        inventoryTableView.reloadData()
    }
    
    func fetchCoreDataObjects() {
        self.fetch{ (complete) in
            if complete {
                if inventory.count >= 1 {
                    inventoryTableView.isHidden = false
                } else {
                    inventoryTableView.isHidden = true
                }
            }
        }
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
        return inventory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? ItemCell else { return UITableViewCell() }
        cell.configureCell(inventory: inventory[indexPath.row])
        return cell
    }
    
    
    func removeInventory(atIndexPath indexPath: IndexPath) {
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        
        manageContext.delete(inventory[indexPath.row])
        
        do {
            try manageContext.save()
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeInventory(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            self.inventoryTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        return [deleteAction]
    }
    
}
