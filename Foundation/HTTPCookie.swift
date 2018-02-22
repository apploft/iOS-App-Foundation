//
//  HTTPCookie.swift
//

import Foundation

public extension HTTPCookie {
    
    public var javaScriptString: String {
        var entries = ["\(name)=\(value)"]
        
        if !domain.isEmpty {
            entries.append("domain=\(domain)")
        }
        if !path.isEmpty {
            entries.append("path=\(path)")
        } else {
            entries.append("path=/")
        }
        if let expiresDate = expiresDate {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "EEE, dd MM yyyy HH:mm:ss zzz"
            entries.append("expires=\(dateFormatter.string(from: expiresDate))")
        }
        if isSecure {
            entries.append("secure=true")
        }
        
        return entries.joined(separator: "; ")
    }
    
}
