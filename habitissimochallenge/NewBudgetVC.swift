//
//  NewBudgetVC.swift
//  habitissimochallenge
//
//  Created by Marcos Molero on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import UIKit

class NewBudgetVC: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var subcategoryField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelBudget(_ sender: Any) {
        // Clear budget fields.
        
        nameField.text = ""
        emailField.text = ""
        phoneField.text = ""
        descriptionField.text = ""
        subcategoryField.text = ""
        locationField.text = ""
        
    }

    @IBAction func saveBudget(_ sender: Any) {
        // Save in DB.
        
        
        
        
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.resignFirstResponder()
    }

}

