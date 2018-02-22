//
//  URL.swift
//

import Foundation

public extension URL {
    
    public var urlAfterHost: URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else { return nil }
        
        components.scheme = nil
        components.host = nil
        components.user = nil
        components.password = nil
        return components.url
    }
    
    public var stringAfterHost: String {
        return urlAfterHost?.absoluteString ?? ""
    }
    
    public func isEqualAfterHost(_ url: URL?) -> Bool {
        return (path == url?.path) &&
            ((query == url?.query) || ((url?.query?.isEmpty != false) && (query?.isEmpty != false)))
    }
    
    public func addHttpsSchemeIfMissing() -> URL {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else { return self }
        
        if components.scheme?.isEmpty ?? true {
            components.scheme = "https"
            return components.url ?? self
        } else {
            return self
        }
    }
    
}
