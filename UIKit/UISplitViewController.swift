//
//  UISplitViewController.swift
//

import UIKit

public extension UISplitViewController {
    
    public var isReallyCollapsed: Bool {
        return traitCollection.horizontalSizeClass == .compact
    }
    
}
