//
//  Budget.swift
//  habitissimochallenge
//
//  Created by Marcos on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

class Budget {
    var description     :String
    var subcategory     :String
    var name            :String
    var email           :String
    var phone           :String
    var localization    :String
    var date            :Int
    
    init() {
        self.description    = String()
        self.subcategory    = String()
        self.name           = String()
        self.email          = String()
        self.phone          = String()
        self.localization   = String()
        self.date           = Int()
        
    }
    
}
