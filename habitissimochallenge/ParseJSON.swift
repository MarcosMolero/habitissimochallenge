//
//  ParseJSON.swift
//  habitissimochallenge
//
//  Created by Marcos Molero on 26/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import SwiftyJSON

class ParseJSON {
    
    static func parseLocations(_ jsonObject:JSON) {
        let instanceAppSingleton = AppSingleton.sharedInstance
        
        for item in jsonObject.arrayValue {
            let location            :Locations = Locations()
            
            location.id         = item["id"].intValue
            location.parent_id  = item["parent_id"].intValue
            location.name       = item["name"].stringValue
            location.zip        = item["zip"].stringValue
            location.geo_lat    = item["geo_lat"].intValue
            location.geo_lng    = item["geo_lng"].intValue
            location.level      = item["level"].intValue
            location.slug       = item["slug"].stringValue
            
            instanceAppSingleton.listOfLocations.append(location)
        }
    }
    
    static func parseCategory(_ jsonObject:JSON) {
        let instanceAppSingleton = AppSingleton.sharedInstance
        
        for item in jsonObject.arrayValue {
            let category            :Category = Category()
            category.id             = item["id"].stringValue
            category.parent_id      = item["parent_id"].stringValue
            category.name           = item["name"].stringValue
            category.description    = item["description"].stringValue
            category.child_count    = item["children_count"].intValue
            category.children       = item["children"].stringValue
            category.slug           = item["slug"].stringValue
            instanceAppSingleton.listOfCategory.append(category)
        }
    }
    
    static func parseSubcategory(_ jsonObject:JSON) {
        let instanceAppSingleton = AppSingleton.sharedInstance

        for item in jsonObject.arrayValue {
            let category            :Category = Category()
            category.id             = item["id"].stringValue
            category.parent_id      = item["parent_id"].stringValue
            category.name           = item["name"].stringValue
            category.description    = item["description"].stringValue
            category.child_count    = item["children_count"].intValue
            category.children       = item["children"].stringValue
            category.slug           = item["slug"].stringValue
            instanceAppSingleton.listOfSubcategory.append(category)
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: subcategoryOk), object: self)
    }
}
