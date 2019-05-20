//
//  SupplierVC.swift
//  powerPlayApp
//
//  Created by Stephenson Ang on 20/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class SupplierVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addSupplierBtnWasPressed(_ sender: Any) {
        guard let addSupplierVC = storyboard?.instantiateViewController(withIdentifier: "AddSupplierVC") as? AddSupplierVC else { return }
        presentDetail(addSupplierVC)
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
}
