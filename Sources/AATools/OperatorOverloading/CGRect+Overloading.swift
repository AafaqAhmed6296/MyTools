//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import Foundation

func + (lhs: CGRect, rhs: CGRect) -> CGRect {
    
    let rect = CGRect(x: lhs.minX + rhs.minX, y: lhs.minY + rhs.minY , width: rhs.width + lhs.width, height: lhs.height + rhs.height)
    
    return rect
}
