//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import Foundation

extension UIImageView {
    
    /// Sets the color of image
    /// - Parameter color: `UIColor` you want to apply on `UIImage` of `UIImageView`
    public func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
