//
//  StringLoading.swift
//

import Foundation


public extension String {
    
    public init?(contentsOf url: URL, headerFields: [String: String], maxLength: Int? = nil) {
        var request = URLRequest(url: url)
        for (key, value) in headerFields {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        let result = URLSession.shared.synchronousDataTask(request: request)
        
        if let data = result.0 {
            if let maxLength = maxLength {
                let upperBound = "".min(maxLength, data.count)
                let subData = data.subdata(in: (0..<upperBound))
                self.init(data: subData, encoding: .utf8)
            } else {
                self.init(data: data, encoding: .utf8)
            }
        } else {
            return nil
        }
    }
    
}

public extension URLSession {
    
    public func synchronousDataTask(request: URLRequest) -> (Data?, URLResponse?, Error?) {
        var data: Data?, response: URLResponse?, error: Error?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        dataTask(with: request) {
            data = $0
            response = $1
            error = $2
            semaphore.signal()
            }.resume()
        
        semaphore.wait()
        
        return (data, response, error)
    }
    
}
