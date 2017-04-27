//
//  WebServiceCommunication.swift
//  habitissimochallenge
//
//  Created by Marcos on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let subcategoryOk       :String = "com.marcosmolero.subcategoryOk"
let connectionFailure   :String = "com.marcosmolero.connectionFailure"

class WebServiceCommunication {
    
    func getCategories() {
        let url         :URL = URL(string: AppConstants.appConnection.WS_URL_CATEGORY)!
        
        Alamofire.request(url)
            .validate()
            .responseString { response in
                switch response.result {
                case .success:
                    if ((response.response?.statusCode)! >= 200 && (response.response?.statusCode)! < 300) {
                        let jsonObject = JSON(data: response.data!)
                        ParseJSON.parseCategory(jsonObject)
                    }
                    break
                case .failure(let error):
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: connectionFailure), object: self)
                    print(error)
                    break
                }
        }
    }
    
    func getSubcategory(_ id:String) {
        let url         :URL = URL(string: AppConstants.appConnection.WS_URL_CATEGORY + "\(id)")!
        
        Alamofire.request(url)
            .validate()
            .responseString { response in
                switch response.result {
                case .success:
                    if ((response.response?.statusCode)! >= 200 && (response.response?.statusCode)! < 300) {
                        let jsonObject = JSON(data: response.data!)
                        ParseJSON.parseSubcategory(jsonObject)
                    }
                    break
                case .failure(let error):
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: connectionFailure), object: self)
                    print(error)
                    break
                }
        }
    }
    
    func getLocations() {
        let url         :URL = URL(string: AppConstants.appConnection.WS_URL_LOCATIONS)!
        
        Alamofire.request(url)
            .validate()
            .responseString { response in
                switch response.result {
                case .success:
                    if ((response.response?.statusCode)! >= 200 && (response.response?.statusCode)! < 300) {
                        let jsonObject = JSON(data: response.data!)
                        ParseJSON.parseLocations(jsonObject)
                    }
                    break
                case .failure(let error):
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: connectionFailure), object: self)
                    print(error)
                    break
                }
        }
    }
    
}
