//
//  AppConstants.swift
//  habitissimochallenge
//
//  Created by Marcos on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

class AppConstants {
    
    struct appDatabase {
        static let LocalDatabaseNew :String = "habitissimoDB.sqlite"
        
    }
    
    struct appConnection {
        static let WS_URL_CATEGORY  :String = "http://api.habitissimo.es/category/list/"
        static let WS_URL_LOCATIONS :String = "http://api.habitissimo.es/location/list"
    }
    
}
