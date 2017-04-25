//
//  UtilValidation.swift
//  habitissimochallenge
//
//  Created by Marcos on 24/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

class UtilValidation {
    
    static func isBudgetValid(_ budget:Budget) -> Bool {
        if budget.name.isEmpty {
            print("This field can't be empty")
            return false
        }
        
        if budget.email.isEmpty {
            print("This field can't be empty")
            return false
        }
        
        if budget.phone.isEmpty {
            print("This field can't be empty")
            return false
        }
        
        if budget.description.isEmpty {
            print("This field can't be empty")
            return false
        }
        
        if budget.subcategory.isEmpty {
            print("This field can't be empty")
            return false
        }
        
        if budget.location.isEmpty {
            print("This field can't be empty")
            return false
        }
        
        if UtilValidation.fieldEmail(budget.email) {
            print("Valid email")
        }else{
            print("Not valid email")
            return false
        }
        
        if UtilValidation.fieldPhone(budget.phone) {
            print("Valid phone")
        }else{
            print("Not valid phone")
            return false
        }
        
        return true
    }
    
    static func fieldEmail(_ email:String) -> Bool {
        let emailRegEx  = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        
        let emailTest   = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result      = emailTest.evaluate(with: email)
        
        return result
    }
    
    static func fieldPhone(_ phone:String) -> Bool {
        let phoneRegEx  = "^[9|6|7][0-9]{8}$"
        
        let phoneTest   = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        let result      = phoneTest.evaluate(with: phone)
        
        return result
    }
}
