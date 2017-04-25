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
    
    func getBudgets() -> [Budget] {
        var listBudget  :[Budget] = [Budget]()
        let query       :String = "SELECT * FROM \(AppConstants.DBHelper.TABLE_BUDGETS)"
        
        sharedInstanceBudget.database?.open()
        let resultSet   :FMResultSet! = sharedInstanceBudget.database!.executeQuery(query, withArgumentsIn: nil)
        if (resultSet != nil) {
            while resultSet.next(){
                let budget  :Budget = Budget()
                if !resultSet.columnIsNull(AppConstants.DBHelper.id){
                    budget.id = Int(resultSet.int(forColumn: AppConstants.DBHelper.id))
                }
                if !resultSet.columnIsNull(AppConstants.DBHelper.description){
                    budget.description = resultSet.string(forColumn: AppConstants.DBHelper.description)
                }
                if !resultSet.columnIsNull(AppConstants.DBHelper.subcategory){
                    budget.subcategory = resultSet.string(forColumn: AppConstants.DBHelper.subcategory)
                }
                if !resultSet.columnIsNull(AppConstants.DBHelper.name){
                    budget.name = resultSet.string(forColumn: AppConstants.DBHelper.name)
                }
                if !resultSet.columnIsNull(AppConstants.DBHelper.email){
                    budget.email = resultSet.string(forColumn: AppConstants.DBHelper.email)
                }
                if !resultSet.columnIsNull(AppConstants.DBHelper.phone){
                    budget.phone = resultSet.string(forColumn: AppConstants.DBHelper.phone)
                }
                if !resultSet.columnIsNull(AppConstants.DBHelper.location){
                    budget.location = resultSet.string(forColumn: AppConstants.DBHelper.location)
                }
                if !resultSet.columnIsNull(AppConstants.DBHelper.actual_date){
                    budget.actual_date = Int(resultSet.int(forColumn: AppConstants.DBHelper.actual_date))
                }
                listBudget.append(budget)
            }
        }
        sharedInstanceBudget.database!.close()
        return listBudget
    }
    
    func insertBudget(_ budget:Budget) {
        let query   :String = "INSERT INTO \(AppConstants.DBHelper.TABLE_BUDGETS) (\(AppConstants.DBHelper.description), \(AppConstants.DBHelper.actual_date),\(AppConstants.DBHelper.subcategory),\(AppConstants.DBHelper.name),\(AppConstants.DBHelper.email),\(AppConstants.DBHelper.phone),\(AppConstants.DBHelper.location)) VALUES ('\(budget.description)', \(budget.actual_date),'\(budget.subcategory)','\(budget.name)','\(budget.email)','\(budget.phone)','\(budget.location)')"
        sharedInstanceBudget.database!.open()
        sharedInstanceBudget.database!.executeUpdate(query, withArgumentsIn: nil)
        sharedInstanceBudget.database!.close()
        print("insertBudget OK")
    }
    
}
