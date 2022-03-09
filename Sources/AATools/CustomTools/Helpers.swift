//
//  File.swift
//  
//
//  Created by Aafaq Ahmed on 17/07/2021.
//

import UIKit


public func attributedText(text: String, font: UIFont, color: UIColor=UIColor.white) -> NSAttributedString {
    let string = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor: color])
    return string
}
