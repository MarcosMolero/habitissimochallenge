//
//  LocationsDAO.swift
//  habitissimochallenge
//
//  Created by Marcos on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import FMDB

let sharedInstanceLocations = LocationsDAO()

class LocationsDAO: NSObject {
    
    var database: FMDatabase? = nil
    
    class var instance: LocationsDAO {
        let myPath                          = UtilFileManagement.getPath(AppConstants.appDatabase.LocalDatabaseNew)
        sharedInstanceLocations.database    = FMDatabase(path: myPath)
        
        return sharedInstanceLocations
    }
}
