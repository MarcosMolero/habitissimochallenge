//
//  CategoryDAO.swift
//  habitissimochallenge
//
//  Created by Marcos on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import FMDB

let sharedInstanceCategory = CategoryDAO()

class CategoryDAO: NSObject {
    
    var database: FMDatabase? = nil
    
    class var instance: CategoryDAO {
        let myPath                      = UtilFileManagement.getPath(AppConstants.appDatabase.LocalDatabaseNew)
        sharedInstanceCategory.database = FMDatabase(path: myPath)
        
        return sharedInstanceCategory
    }
}
