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
        
        nameLabel.text          = budgetDetail.name
        phoneLabel.text         = budgetDetail.phone
        emailLabel.text         = budgetDetail.email
        locationLabel.text      = budgetDetail.location
        subcategoryLabel.text   = budgetDetail.subcategory
        descriptionLabel.text   = budgetDetail.description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
