//
//  Budget.swift
//  habitissimochallenge
//
//  Created by Marcos on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

class Budget {
    var id              :Int
    var description     :String
    var subcategory     :String
    var name            :String
    var email           :String
    var phone           :String
    var location        :String
    var actual_date     :Int
    
    init() {
        self.id             = Int()
        self.description    = String()
        self.subcategory    = String()
        self.name           = String()
        self.email          = String()
        self.phone          = String()
        self.location       = String()
        self.actual_date    = Int()
        
    }
    
}
