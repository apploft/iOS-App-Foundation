//
//  FileManager.swift
//

import Foundation

public extension FileManager {
    
    public func removeItem(atPath path: String, inDirectory directory: FileManager.SearchPathDirectory) -> Bool {
        guard let basePath = NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true).first,
            fileExists(atPath: basePath + path)
            else { return false }
        
        do {
            try removeItem(atPath: basePath + path)
            return true
        } catch let error {
            print("error while removing item at path \(basePath + path): \(error)")
            return false
        }
    }
    
}
