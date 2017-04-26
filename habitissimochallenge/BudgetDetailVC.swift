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
        
        nameLabel.text          = instanceAppSingleton.budget.name
        phoneLabel.text         = instanceAppSingleton.budget.phone
        emailLabel.text         = instanceAppSingleton.budget.email
        locationLabel.text      = instanceAppSingleton.budget.location
        subcategoryLabel.text   = instanceAppSingleton.budget.subcategory
        descriptionLabel.text   = instanceAppSingleton.budget.description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
