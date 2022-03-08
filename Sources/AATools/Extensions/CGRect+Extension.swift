//
//  CGRect+Extension.swift
//  
//
//  Created by Aafaq on 08/03/2022.
//

import UIKit

extension CGRect {
    static func + (lhs: CGRect, rhs: CGRect) -> CGRect {
        CGRect(x: lhs.minX + rhs.minX, y: lhs.minY + rhs.minY, width: rhs.width + lhs.width, height: lhs.height + rhs.height)
    }
}
