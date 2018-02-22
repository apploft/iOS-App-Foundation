//
//  UIViewController.swift
//

import UIKit

public extension UIViewController {
    
    public class func visibleViewController() -> UIViewController? {
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        
        if let presentedViewController = rootViewController?.presentedViewController {
            return presentedViewController
        }
        return rootViewController
    }
    
    public class func topViewController(of controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.topViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        return controller
    }
    
    public class func presentAlert(withTitle title: String? = nil, message: String? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: NSLocalizedString("Ok", comment: "ok button"), style: .default, handler: nil)
            alertController.addAction(okAction)
            UIViewController.visibleViewController()?.present(alertController, animated: true, completion: nil)
        }
    }
    
}

    
public extension UIViewController {
    
    public var previousViewController: UIViewController? {
        guard let viewControllers = navigationController?.viewControllers, viewControllers.count > 1  else { return nil }
        
        return viewControllers[viewControllers.count - 2]
    }
    
}
