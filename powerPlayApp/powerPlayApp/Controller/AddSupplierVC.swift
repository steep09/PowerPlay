//
//  AddSupplierVC.swift
//  powerPlayApp
//
//  Created by Stephenson Ang on 20/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import CoreData

class AddSupplierVC: UIViewController {
    
    @IBOutlet weak var supplierNameTxtField: UITextField!
    @IBOutlet weak var supplierContactNumber: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CreateBtnWasPressed(_ sender: Any) {
        if supplierNameTxtField.text != "" && supplierContactNumber.text != "" {
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
    
    func save(completion: (_ finished: Bool) -> ()) {
        //DATABASE
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        let supplier = Supplier(context: manageContext)
        
        supplier.supplierName = supplierNameTxtField.text
        supplier.contactNumber = Int32(supplierContactNumber.text!)!
        do {
            try manageContext.save()
            completion(true)
        } catch {
            debugPrint("Could not Save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
