//
//  UtilFileManagement.swift
//  habitissimochallenge
//
//  Created by Marcos on 24/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

class UtilFileManagement {
    
    class func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory as NSString
    }
    
    class func getPath(_ fileName: String) -> String {
        let documentsURL    = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL         = documentsURL.appendingPathComponent(fileName)
        return fileURL.path
    }
    
    class func copyFile(_ fileName: NSString) {
        let dbPath      :String = getPath(fileName as String)
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: dbPath) {
            
            let documentsURL    = Bundle.main.resourceURL
            let fromPath        = documentsURL!.appendingPathComponent(fileName as String)
            
            var error : NSError?
            do {
                try fileManager.copyItem(atPath: fromPath.path, toPath: dbPath)
            } catch let error1 as NSError {
                error = error1
            }
            
            if (error != nil) {
                print(error?.localizedDescription as Any)
            } else {
                print("Your database copied successfully")
            }
        }
    }
    
    class func deleteFile(_ fileName: NSString) {
        print("Proceding to delete file...")
        var delError:NSError?
        let dbRemovePath: String = getPath(fileName as String)
        
        if FileManager.default.isDeletableFile(atPath: dbRemovePath) {
            let success: Bool
            do {
                try FileManager.default.removeItem(atPath: dbRemovePath)
                success = true
            } catch let error as NSError {
                delError = error
                success = false
            }
            if (!success) {
                print("Error removing file at path")
            }
        }
    }
}
