//
//  WKWebView.swift
//

import WebKit

public extension WKWebView {
    
    typealias JavaScriptCompletionHandler = ((Any?, Error?) -> Void)
    
    public func executeJavaScriptFile(_ filename: String, completionHandler: JavaScriptCompletionHandler?) {
        if let path = Bundle.main.path(forResource: filename, ofType: "js"),
            let source = try? NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue) as String {
                return evaluateJavaScript(source, completionHandler: completionHandler)
        } else {
            print("user script could not be executed from file '\(filename).js'")
            return
        }
    }
    
}
