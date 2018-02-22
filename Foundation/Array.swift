//
//  Array.swift
//

import Foundation

public extension Array where Element : Hashable {
    
    public var unique: [Element] {
        return Array(Set(self))
    }
    
}

public extension Array {
    
    public mutating func removeFirstOrNil() -> Element? {
        if isEmpty { return nil }
        return removeFirst()
    }
    
}
