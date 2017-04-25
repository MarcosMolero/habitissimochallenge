//
//  AppSingleton.swift
//  habitissimochallenge
//
//  Created by Marcos on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

class AppSingleton {

    static let sharedInstance: AppSingleton = AppSingleton()

    var budget      :Budget
    var listBudget  :[Budget]
    
    init() {
        self.budget     = Budget()
        self.listBudget = [Budget]()
        
    }
}
