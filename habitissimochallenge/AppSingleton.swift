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

    var budget              :Budget
    var listBudget          :[Budget]
    var listOfLocations     :[Locations]
    var listOfCategory      :[Category]
    var listOfSubcategory   :[Category]
    
    init() {
        self.budget             = Budget()
        self.listBudget         = [Budget]()
        self.listOfLocations    = [Locations]()
        self.listOfCategory     = [Category]()
        self.listOfSubcategory  = [Category]()
    }
    
    func resetSubcategory() {
        self.listOfSubcategory = [Category]()
    }
}
