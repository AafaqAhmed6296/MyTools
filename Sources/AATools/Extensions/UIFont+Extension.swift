//
//  UIFont+Extension.swift
//  
//
//  Created by Aafaq on 09/03/2022.
//

import Foundation
import UIKit

extension UIFont {
    public static func appFont(style: AppFont, size: CGFloat) -> UIFont {
        
        if style == .system {
            return .systemFont(ofSize: size)
        } else {
            return .init(name: style.rawValue, size: size)!
        }
    }
}
