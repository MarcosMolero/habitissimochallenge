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
        nameField.text          = ""
        emailField.text         = ""
        phoneField.text         = ""
        descriptionField.text   = ""
        subcategoryField.text   = ""
        locationField.text      = ""
    }

    @IBAction func saveBudget(_ sender: Any) {
        // Save in DB.
        
        if (nameField.text?.isEmpty)! {
            print("This field can't be empty")
        }
        
        if (emailField.text?.isEmpty)! {
            print("This field can't be empty")
        }
        
        if (phoneField.text?.isEmpty)! {
            print("This field can't be empty")
        }
        
        if (descriptionField.text?.isEmpty)! {
            print("This field can't be empty")
        }
        
        if (subcategoryField.text?.isEmpty)! {
            print("This field can't be empty")
        }
        
        if (locationField.text?.isEmpty)! {
            print("This field can't be empty")
        }
        
        if UtilValidation.fieldEmail(emailField.text!) {
            print("Valid")
        }else{
            print("Not valid")
        }
        
        if UtilValidation.fieldPhone(phoneField.text!) {
            print("Valid")
        }else{
            print("Not valid")
        }
        
        let instanceAppSingleton = AppSingleton.sharedInstance
        instanceAppSingleton.budget.description     = descriptionField.text!
        instanceAppSingleton.budget.subcategory     = subcategoryField.text!
        instanceAppSingleton.budget.name            = nameField.text!
        instanceAppSingleton.budget.email           = emailField.text!
        instanceAppSingleton.budget.phone           = phoneField.text!
        instanceAppSingleton.budget.location        = locationField.text!
        instanceAppSingleton.budget.actual_date     = Int(NSDate().timeIntervalSince1970)
        
        BudgetDAO.instance.insertBudget(instanceAppSingleton.budget)
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.resignFirstResponder()
    }

}

