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
    
    let instanceAppSingleton = AppSingleton.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerView          :UIPickerView = UIPickerView()
        pickerView.delegate     = self
        locationField.inputView = pickerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func cancelBudget(_ sender: Any) {
        clearFields()
    }

    @IBAction func saveBudget(_ sender: Any) {
        instanceAppSingleton.budget.description     = descriptionField.text!
        instanceAppSingleton.budget.subcategory     = subcategoryField.text!
        instanceAppSingleton.budget.name            = nameField.text!
        instanceAppSingleton.budget.email           = emailField.text!
        instanceAppSingleton.budget.phone           = phoneField.text!
        instanceAppSingleton.budget.location        = locationField.text!
        instanceAppSingleton.budget.actual_date     = Int(NSDate().timeIntervalSince1970)
        
        if UtilValidation.isBudgetValid(instanceAppSingleton.budget) {
            BudgetDAO.instance.insertBudget(instanceAppSingleton.budget)
            UtilAlertManagement.budgetSaved(self)
            clearFields()
        } else {
            UtilAlertManagement.budgetNotValid(self)
        }        
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.resignFirstResponder()
    }
    
    func clearFields() {
        nameField.text          = ""
        emailField.text         = ""
        phoneField.text         = ""
        descriptionField.text   = ""
        subcategoryField.text   = ""
        locationField.text      = ""
    }
    
    // MARK: Picker Delegates
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return instanceAppSingleton.listOfLocations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return instanceAppSingleton.listOfLocations[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationField.text = instanceAppSingleton.listOfLocations[row].name
    }

}

