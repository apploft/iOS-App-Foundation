//
//  UIDevice.swift
//

import UIKit

public extension UIDevice {
    
    public var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        return machineMirror.children.reduce("") { (identifier: String, element: (label: String?, value: Any)) -> String in
            guard let version = valueToVersion(element.value) else { return identifier }
            return identifier + version
        }
    }
    
    private func valueToVersion(_ value: Any) -> String? {
        guard let value = value as? Int8, value != 0 else { return nil }
        return String(UnicodeScalar(UInt8(value)))
    }
    
}
