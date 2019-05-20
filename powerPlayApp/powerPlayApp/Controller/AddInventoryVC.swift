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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func CreateBtnWasPressed(_ sender: Any) {
        if itemNameTxtField.text != "" && itemQuantityTxtField.text != "" && itemPriceTxtField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    //saving data inside the database
    func save(completion: (_ finished: Bool) -> ()) {
        //DATABASE
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        let inventory = Inventory(context: manageContext)
        
        inventory.itemName = itemNameTxtField.text
        inventory.itemQuantity = Int32(itemQuantityTxtField.text!)!
        inventory.itemPrice = Double(itemPriceTxtField.text!)!
        do {
            try manageContext.save()
            completion(true)
        } catch {
            debugPrint("Could not Save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
