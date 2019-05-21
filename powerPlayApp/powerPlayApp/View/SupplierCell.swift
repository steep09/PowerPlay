//
//  SupplierCell.swift
//  powerPlayApp
//
//  Created by Stephenson Ang on 21/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import CoreData

class SupplierCell: UITableViewCell {
    
    @IBOutlet weak var supplierName: UILabel!
    @IBOutlet weak var supplierContactNumber: UILabel!
    
    func configureCell(supplier: Supplier) {
        self.supplierName.text = supplier.supplierName
        self.supplierContactNumber.text = String(supplier.contactNumber)
    }
}
