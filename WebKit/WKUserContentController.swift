//
//  WKUserContentController.swift
//

import Foundation
import WebKit

public extension WKUserContentController {
    
    public func addUserScriptFromFile(_ filename: String, withArguments arguments: [String:String] = [:], injectionTime: WKUserScriptInjectionTime = .atDocumentEnd, forMainFrameOnly: Bool = true) {
        if let path = Bundle.main.path(forResource: filename, ofType: "js"),
            var source = try? NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue) as String {
            if !arguments.isEmpty {
                for (key, value) in arguments {
                    source = source.replacingOccurrences(of: key, with: value)
                }
            }
            let script = WKUserScript(source: source, injectionTime: injectionTime, forMainFrameOnly: forMainFrameOnly)
            self.addUserScript(script)
        } else {
            print("user script could not be added from file '\(filename).js'")
        }
    }
    
}
