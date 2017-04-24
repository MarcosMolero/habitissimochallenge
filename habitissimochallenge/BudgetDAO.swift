//
//  BudgetDAO.swift
//  habitissimochallenge
//
//  Created by Marcos on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import FMDB

let sharedInstanceBudget = BudgetDAO()

class BudgetDAO: NSObject {
    
    var database: FMDatabase? = nil
    
    class var instance: BudgetDAO {
        let myPath                      = UtilFileManagement.getPath(AppConstants.appDatabase.LocalDatabaseNew)
        sharedInstanceBudget.database   = FMDatabase(path: myPath)
        
        return sharedInstanceBudget
    }
    
    func insertBudget(_ budget:Budget) {
        let query   :String = "INSERT INTO \(AppConstants.DBHelper.TABLE_BUDGETS) (\(AppConstants.DBHelper.description),\(AppConstants.DBHelper.subcategory),\(AppConstants.DBHelper.name),\(AppConstants.DBHelper.email),\(AppConstants.DBHelper.phone),\(AppConstants.DBHelper.location),) VALUES ('\(budget.description)','\(budget.subcategory)','\(budget.name)','\(budget.email)','\(budget.phone)','\(budget.localization)')"
        sharedInstanceBudget.database!.open()
        sharedInstanceBudget.database!.executeUpdate(query, withArgumentsIn: nil)
        sharedInstanceBudget.database!.close()
        print("insertBudget OK")
    }
    
}
