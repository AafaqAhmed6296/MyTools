//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import UIKit

extension NSAttributedString {
    
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
    
    /// This is still faulty not usable yet use String class function instead
    private func estimatedSizeForString(widthOfLabel: CGFloat) -> CGRect? {
        var range = NSRange(location: 0, length: self.string.count)
        let attributes = self.attributes(at: 1, effectiveRange: &range)
        
        var extractedAttributes = [(attributes: [NSAttributedString.Key:Any], range: NSRange)]()
        self.enumerateAttributes(in: NSRange(location: 0, length: self.length - (self.length - 1)), options: NSAttributedString.EnumerationOptions(rawValue: 0)) { (dict, range, stopEnumerating) in
            extractedAttributes.append((attributes: dict, range: range))
        }
        
        if let attribute = extractedAttributes.first(where: { $0.range == NSRange(location: 0, length: self.length - (self.length - 1))}) {
            let size = CGSize(width: widthOfLabel, height: 1000)
            let estimatedFrame = NSString(string: string).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attribute.attributes, context: nil)
            return estimatedFrame
        } else {
            
            return nil
        }
    }
}
