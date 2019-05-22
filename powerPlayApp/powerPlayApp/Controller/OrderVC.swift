//
//  OrderVC.swift
//  powerPlayApp
//
//  Created by Stephenson Ang on 22/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class OrderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addOrderBtnWasPressed(_ sender: Any) {
        guard let addOrderVC = storyboard?.instantiateViewController(withIdentifier: "AddOrderVC") as? AddOrderVC else { return }
        presentDetail(addOrderVC)
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
}
