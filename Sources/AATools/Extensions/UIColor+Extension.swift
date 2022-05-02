//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import UIKit

extension UIColor {
    public static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    convenience init(red: UInt64, green: UInt64, blue: UInt64) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /// Create a UIColor with the given hexValue
    /// - Parameter hexValue: provide hexValue as a UInt32
    /// - For Example
    /// ```
    /// let color = UIColor(hexValue: 0x2980b9)
    /// ```
    public
    convenience init(hexValue: UInt64) {
        self.init(
            red: (hexValue & 0xFF0000) >> 16,
            green: (hexValue & 0x00FF00) >> 8,
            blue: hexValue & 0x0000FF
        )
    }

}
