//
//  AddOrderVC.swift
//  powerPlayApp
//
//  Created by Stephenson Ang on 22/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import CoreData

class AddOrderVC: UIViewController {
    
    @IBOutlet weak var orderItemTableView: UITableView!
    @IBOutlet weak var inventoryTableView: UITableView!
    
    var inventoryItem: [Inventory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inventoryTableView.delegate = self
        inventoryTableView.dataSource = self
    }
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Inventory>(entityName: "Inventory")
        
        do {
            inventoryItem = try manageContext.fetch(fetchRequest)
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
                if inventoryItem.count >= 1 {
                    inventoryTableView.isHidden = false
                } else {
                    inventoryTableView.isHidden = true
                }
            }
        }
    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
}

extension AddOrderVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventoryItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? ItemCell else { return UITableViewCell() }
        cell.configureCell(inventory: inventoryItem[indexPath.row])
        return cell
    }
    
}
