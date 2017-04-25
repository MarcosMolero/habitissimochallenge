//
//  UtilAlertManagement.swift
//  habitissimochallenge
//
//  Created by Marcos on 25/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

class UtilAlertManagement {
    
    static func budgetIsNotValid(_ actualViewController: UIViewController) {
        
        let alert = UIAlertController(  title: "ALERT",
                                        message: "Fields are empty or not valid format",
                                        preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(  title: "I Agree",
                                        style: UIAlertActionStyle.default,
                                        handler: nil))
        
        actualViewController.present(alert, animated: true, completion:nil)
    }
}
