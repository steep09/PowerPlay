//
//  ViewController.swift
//  powerPlayApp
//
//  Created by Stephenson Ang on 15/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func orderBtnWasPressed(_ sender: Any) {
        guard let orderVC = storyboard?.instantiateViewController(withIdentifier: "OrderVC") else { return }
        presentDetail(orderVC)
    }
    
    @IBAction func supplierBtnWasPressed(_ sender: Any) {
        guard let supplierVC = storyboard?.instantiateViewController(withIdentifier: "SupplierVC") else { return }
        presentDetail(supplierVC)
    }
    
    @IBAction func inventoryBtnWasPressed(_ sender: Any) {
        guard let inventoryVC = storyboard?.instantiateViewController(withIdentifier: "InventoryVC") else { return }
        presentDetail(inventoryVC)
    }
}

