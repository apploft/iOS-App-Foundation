//
//  Error.swift
//

import Foundation

public extension Error {
    
    public var code: Int {
        return (self as NSError).code
    }
    public var domain: String {
        return (self as NSError).domain
    }
    
}
