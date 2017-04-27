//
//  Category.swift
//  habitissimochallenge
//
//  Created by Marcos on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

class Category {
    var id          :String
    var parent_id   :String
    var name        :String
    var description :String
    var child_count :Int
    var children    :String
    var slug        :String
    
    init() {
        self.id             = String()
        self.parent_id      = String()
        self.name           = String()
        self.description    = String()
        self.child_count    = Int()
        self.children       = String()
        self.slug           = String()
        
    }
    
}
