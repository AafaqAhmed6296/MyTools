//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import Foundation

extension UIButton {
    
    /// Apply the attributed title to the button
    /// - Parameters:
    ///   - firstRegularString: string that you need in normal font not bold
    ///   - secondBoldString: string that you want in bold, this will concatenate after firstRegularString
    ///   - firstStringColor: `UIColor` for the firstRegularString
    ///   - secondStringColor: `UIColor` for the secondBoldString
    ///   - firstStringFont: `UIFont` for the firstRegularString
    ///   - secondStringFont: `UIFont` for the secondBoldString
    public func attributedTitle(firstRegularString: String, secondBoldString: String, firstStringColor: UIColor = UIColor.black, secondStringColor: UIColor=UIColor.black, firstStringFont: UIFont=UIFont.systemFont(ofSize: 16), secondStringFont: UIFont=UIFont.boldSystemFont(ofSize: 16) ) {
        
        let atts : [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: firstStringColor,
                                                    .font: firstStringFont]
        
        let attributedTitle = NSMutableAttributedString(string: "\(firstRegularString)", attributes: atts)
        
        let boldAtts : [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: secondStringColor,
                                                        .font: secondStringFont]
        attributedTitle.append(NSAttributedString(string: secondBoldString, attributes: boldAtts))
        
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
