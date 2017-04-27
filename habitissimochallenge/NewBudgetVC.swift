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
    @IBOutlet weak var categoryField: UITextField!
    
    let instanceAppSingleton    = AppSingleton.sharedInstance
    let utilActivityIndicator   :UtilActivityIndicator = UtilActivityIndicator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerView :UIPickerView = UIPickerView()
        pickerView.delegate         = self
        locationField.inputView     = pickerView
        categoryField.inputView     = pickerView
        subcategoryField.inputView  = pickerView
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
        categoryField.text      = ""
        subcategoryField.text   = ""
        locationField.text      = ""
    }
    
    func loadSubcategory() {
        NotificationCenter.default.removeObserver(self,name:NSNotification.Name(rawValue: subcategoryOk),object: nil)
        utilActivityIndicator.stopActivityIndicator(utilActivityIndicator.actInd)
    }
    
    // MARK: Picker Delegates
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if locationField.isEditing {
            return instanceAppSingleton.listOfLocations.count
        }
        
        if categoryField.isEditing {
            return instanceAppSingleton.listOfCategory.count
        }
        
        if subcategoryField.isEditing {
            return instanceAppSingleton.listOfSubcategory.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if locationField.isEditing {
            return instanceAppSingleton.listOfLocations[row].name
        }
        
        if categoryField.isEditing {
            return instanceAppSingleton.listOfCategory[row].name
        }
        
        if subcategoryField.isEditing {
            return instanceAppSingleton.listOfSubcategory[row].name
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if locationField.isEditing {
            locationField.text = instanceAppSingleton.listOfLocations[row].name
        }
        
        if categoryField.isEditing {
            NotificationCenter.default.addObserver(self, selector: #selector(NewBudgetVC.loadSubcategory), name: NSNotification.Name(rawValue: subcategoryOk), object: nil)

            categoryField.text = instanceAppSingleton.listOfCategory[row].name
            
            utilActivityIndicator.startActivityIndicator(utilActivityIndicator.showActivityIndicator(view))
            let webServiceCommunication :WebServiceCommunication = WebServiceCommunication()
            webServiceCommunication.getSubcategory(instanceAppSingleton.listOfCategory[row].id)
        }
        
        if subcategoryField.isEditing {
            subcategoryField.text = instanceAppSingleton.listOfSubcategory[row].name
        }
    }

}

