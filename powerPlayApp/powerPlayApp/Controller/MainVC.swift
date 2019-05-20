//
//  ViewController.swift
//  powerPlayApp
//
//  Created by Stephenson Ang on 15/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func inventoryBtnWasPressed(_ sender: Any) {
        guard let inventoryVC = storyboard?.instantiateViewController(withIdentifier: "InventoryVC") else { return }
        presentDetail(inventoryVC)
    }
}

