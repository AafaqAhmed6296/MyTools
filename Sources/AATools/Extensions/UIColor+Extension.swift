//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import UIkit

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
    /// - Parameter hexValue: provide hexValue as a String
    /// - For Example
    /// ```
    /// let color = UIColor(hexValue: "#2980b9")
    /// ```
    convenience init(hexValue: String) {
        let actualHexValue = hexValue.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: actualHexValue).scanHexInt64(&rgb)
        
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

}
