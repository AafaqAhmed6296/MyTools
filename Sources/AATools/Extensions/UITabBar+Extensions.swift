//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import UIKit

extension UITabBar {
    
    /// Sets the tab bar transparent.
    static public func setTransparentTabBar() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
    }
}
