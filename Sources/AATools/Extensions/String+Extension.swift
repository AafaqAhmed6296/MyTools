//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import UIKit
import Foundation

extension String {
    public func toInt() -> Int {
        return Int(self) ?? 0
    }
    
    public func toDouble() -> Double {
        return Double(self) ?? 0.0
    }
    
    public func toDate(format: String="d MMM yyyy") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = .current
        return dateFormatter.date(from: self) ?? Date()
    }
    
    /// Use if you want the estimated frame (box) for string
    /// - Parameters:
    ///   - widthOfLabel: width of the label for whom you want the frame
    ///   - font: `UIFont` of your need
    ///   - lineHeight: LineHeight of text, default is 10
    /// - Returns: returns the estimated frame that is needed for the string
    public func estimatedHeightOfString(widthOfLabel: CGFloat, font: UIFont, lineHeight: CGFloat=10, kern: CGFloat=0) -> CGFloat {

        let size = CGSize(width: widthOfLabel, height: 1000)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        
        let attributes = [
            NSAttributedString.Key.font : font, .paragraphStyle: paragraphStyle,
            NSAttributedString.Key.kern : kern
        ] as [ NSAttributedString.Key: Any ]
        
        let estimatedFrame = NSString(string: self).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame.height
    }
    
    /// Use if you want the estimated frame (box) for string
    /// - Parameters:
    ///   - widthOfLabel: width of the label for whom you want the frame
    ///   - font: `UIFont` of your need
    ///   - lineHeight: LineHeight of text, default is 10
    /// - Returns: returns the estimated frame that is needed for the string
    @available(*, deprecated, message: "method name is changed to estimatedHeightOfString and return type is changed CGFloat, use new method instead", renamed: "estimatedHeightOfString(widthOfLabel:font:lineHeight:kern:)")
    public func estimatedFrameOfString(widthOfLabel: CGFloat, font: UIFont, lineHeight: CGFloat=10, kern: CGFloat=0) -> CGRect {

        let size = CGSize(width: widthOfLabel, height: 1000)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        
        let attributes = [
            NSAttributedString.Key.font : font, .paragraphStyle: paragraphStyle,
            NSAttributedString.Key.kern : kern
        ] as [NSAttributedString.Key: Any]
        
        let estimatedFrame = NSString(string: self).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame
    }
    
    /// Use if you want the estimated frame (box) for string
    /// - Parameters:
    ///   - heightOfLabel: height of the label for whom you want the frame
    ///   - font: `UIFont` of your need
    ///   - lineHeight: LineHeight of text, default is 10
    ///   - kern: kerning of the text
    /// - Returns: returns the estimated frame that is needed for the string
    public func estimatedWidthOfString(heightOfLabel: CGFloat, font: UIFont, lineHeight: CGFloat=10, kern: CGFloat=0) -> CGFloat {

        let size = CGSize(width: 10000, height: heightOfLabel)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        
        let attributes = [
            NSAttributedString.Key.font : font, .paragraphStyle: paragraphStyle,
            NSAttributedString.Key.kern : kern
        ] as [NSAttributedString.Key : Any]
        
        let estimatedFrame = NSString(string: self).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame.width
    }

}

//MARK: - TextValidation

extension String {
    func isValidName() -> Bool {
        let inputRegEx = "^[a-zA-Z\\_]{2,25}$"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    func isValidEmail() -> Bool {
        let inputRegEx = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[A-Za-z]{2,64}"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    func isValidPhone() -> Bool {
        let inputRegEx = "^((\\+)|(00))[0-9]{6,14}$"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    func isValidPassword() -> Bool {
        let inputRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()-_+={}?>.<,:;~`']{8,}$"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    
    public func filterPhoneNumber() -> String {
        return String(self.filter {!" ()._-\n\t\r".contains($0)})
    }
}
