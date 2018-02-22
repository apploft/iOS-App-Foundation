//
//  UITabBarController.swift
//
//  source: http://stackoverflow.com/questions/27008737/how-do-i-hide-show-tabbar-when-tapped-using-swift-in-ios8/27072876#27072876
//

import UIKit

public extension UITabBarController {
    
    public func setTabBarVisible(_ visible:Bool, animated:Bool) {
        // bail if the current state matches the desired state
        if (tabBarIsVisible() == visible) { return }
        
        // get a frame calculation ready
        let offsetY = tabBar.frame.size.height
        
        // animate the tabBar
        UIView.animate(withDuration: animated ? 0.3 : 0.0, animations: {
            self.view.frame.size.height += (visible ? -offsetY : offsetY)
            self.view.setNeedsDisplay()
            self.view.layoutIfNeeded()
        }, completion: { finished in
            if finished {
                self.tabBar.isHidden = !visible
            }
        })
    }
    
    public func tabBarIsVisible() -> Bool {
        return view.frame.size.height == view.superview?.frame.size.height
    }
    
}
