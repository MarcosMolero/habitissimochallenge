//
//  BudgetDetailVC.swift
//  habitissimochallenge
//
//  Created by Marcos on 25/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

class BudgetDetailVC: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var subcategoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var budgetDetail    :Budget = Budget()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let instanceAppSingleton = AppSingleton.sharedInstance
        
        nameLabel.text          = "Name: " + instanceAppSingleton.budget.name
        phoneLabel.text         = "Phone: " + instanceAppSingleton.budget.phone
        emailLabel.text         = "Email: " + instanceAppSingleton.budget.email
        locationLabel.text      = "Location: " + instanceAppSingleton.budget.location
        subcategoryLabel.text   = "Subcategory: " + instanceAppSingleton.budget.subcategory
        descriptionLabel.text   = "Description: " + instanceAppSingleton.budget.description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
