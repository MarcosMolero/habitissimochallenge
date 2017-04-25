//
//  NewBudgetVC.swift
//  habitissimochallenge
//
//  Created by Marcos Molero on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import UIKit

class NewBudgetVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var subcategoryField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    
    var pickOption = ["one", "two", "three", "seven", "fifteen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerView          :UIPickerView = UIPickerView()
        pickerView.delegate     = self
        locationField.inputView = pickerView
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
            return
        }
        
        if (emailField.text?.isEmpty)! {
            print("This field can't be empty")
            return
        }
        
        if (phoneField.text?.isEmpty)! {
            print("This field can't be empty")
            return
        }
        
        if (descriptionField.text?.isEmpty)! {
            print("This field can't be empty")
            return
        }
        
        if (subcategoryField.text?.isEmpty)! {
            print("This field can't be empty")
            return
        }
        
        if (locationField.text?.isEmpty)! {
            print("This field can't be empty")
            return
        }
        
        if UtilValidation.fieldEmail(emailField.text!) {
            print("Valid email")
        }else{
            print("Not valid email")
            return
        }
        
        if UtilValidation.fieldPhone(phoneField.text!) {
            print("Valid phone")
        }else{
            print("Not valid phone")
            return
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: Picker Delegates
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationField.text = pickOption[row]
    }

}

