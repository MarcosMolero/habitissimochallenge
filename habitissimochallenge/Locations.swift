//
//  Locations.swift
//  habitissimochallenge
//
//  Created by Marcos on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

class Locations {
    var id          :Int
    var parent_id   :Int
    var name        :String
    var zip         :String
    var geo_lat     :Int
    var geo_lng     :Int
    var level       :Int
    var slug        :String
    
    init() {
        self.id         = Int()
        self.parent_id  = Int()
        self.name       = String()
        self.zip        = String()
        self.geo_lat    = Int()
        self.geo_lng    = Int()
        self.level      = Int()
        self.slug       = String()
        
    }
    
}
