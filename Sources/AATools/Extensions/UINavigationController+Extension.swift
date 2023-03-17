//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import UIKit

extension UINavigationController {
    /// Pops to the view controller of a specified class in the navigation stack.
    ///
    /// - Parameters:
    ///   - ofClass: The class of the view controller to pop to.
    ///   - animated: A Boolean value that indicates whether the transition is animated. Default value is `true`.
    ///  Following example pops to a view controller of class `MyViewController`
    ///  ```
    ///     navigationController?.popToViewController(ofClass: MyViewController.self)
    ///  ```

    public func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(vc, animated: animated)
        }
    }
}
