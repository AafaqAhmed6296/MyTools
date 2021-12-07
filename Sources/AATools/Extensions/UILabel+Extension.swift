//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import Foundation

extension UILabel {
    
    public var actualFontSize: CGFloat {
        //initial label
        let fullSizeLabel = UILabel()
        fullSizeLabel.font = self.font
        fullSizeLabel.text = self.text
        fullSizeLabel.sizeToFit()
        
        var actualFontSize: CGFloat = self.font.pointSize * (self.bounds.size.width / fullSizeLabel.bounds.size.width);
        
        //correct, if new font size bigger than initial
        actualFontSize = actualFontSize < self.font.pointSize ? actualFontSize : self.font.pointSize;
        
        return actualFontSize
    }
    
}
