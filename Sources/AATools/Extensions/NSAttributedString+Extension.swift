//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import UIKit
import Foundation

extension NSAttributedString {
    
    public
    static func attributedString (
        fString string1: String,
        fSColor color1: UIColor,
        fSFont font1: UIFont,
        sString string2: String="",
        sSColor color2: UIColor=UIColor.black,
        sSFont font2: UIFont=UIFont.systemFont(ofSize: 16),
        lineHeight: CGFloat=NSParagraphStyle().minimumLineHeight,
        lineBreakMode: NSLineBreakMode = .byTruncatingTail,
        kern1: CGFloat = 0
    ) -> NSMutableAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.lineBreakMode = lineBreakMode
        
        let attString = NSMutableAttributedString(string: string1, attributes: [NSAttributedString.Key.font : font1, .foregroundColor: color1, .paragraphStyle: paragraphStyle ])
        
        attString.addAttributes([NSAttributedString.Key.kern : kern1], range: NSRange(location: 0, length: attString.length - 1))
        
        if string2 != "" {
            attString.append(NSAttributedString(string: string2, attributes: [NSAttributedString.Key.font : font2, .foregroundColor: color2, .paragraphStyle: paragraphStyle ]))
        }
        
        return attString
    }
    
    public func sizeFittingWidth(_ w: CGFloat) -> CGSize {
        let textStorage = NSTextStorage(attributedString: self)
        let size = CGSize(width: w, height: CGFloat.greatestFiniteMagnitude)
        let boundingRect = CGRect(origin: .zero, size: size)

        let textContainer = NSTextContainer(size: size)
        textContainer.lineFragmentPadding = 0

        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)

        textStorage.addLayoutManager(layoutManager)

        layoutManager.glyphRange(forBoundingRect: boundingRect, in: textContainer)

        let rect = layoutManager.usedRect(for: textContainer)

        return rect.integral.size
    }    
}
