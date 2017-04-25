//
//  AppConstants.swift
//  habitissimochallenge
//
//  Created by Marcos on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

class AppConstants {
    
    struct DBHelper {
        static let TABLE_BUDGETS    :String = "BUDGETS"
        static let id               :String = "id"
        static let actual_date      :String = "actual_date"
        static let description      :String = "description"
        static let subcategory      :String = "subcategory"
        static let name             :String = "name"
        static let email            :String = "email"
        static let phone            :String = "phone"
        static let location         :String = "location"
        
    }
    
    struct appDatabase {
        static let LocalDatabaseNew :String = "habitissimoDB_v100_1.sqlite"
        
    }
    
    struct appConnection {
        static let WS_URL_CATEGORY  :String = "http://api.habitissimo.es/category/list/"
        static let WS_URL_LOCATIONS :String = "http://api.habitissimo.es/location/list"
    }
    
}
