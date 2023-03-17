//
//  LeftIndentTextField.swift
//  
//
//  Created by Aafaq on 12/01/2022.
//

import UIKit

/// A custom text field class with left indentation.
public class LeftIndentTextField: UITextField {
    /// Initializes the custom text field with left indentation and background color.
    ///
    /// - Parameters:
    ///   - leftSpacing: The left spacing to be set for the text field.
    ///   - color: The background color to be set for the text field.
    public init(leftSpacing: CGFloat = 12, color: UIColor = .white) {
        super.init(frame: .zero)
        
        let leftView = UIView()
        leftView.setWidth(leftSpacing)
        leftView.backgroundColor = color
        self.leftView = leftView
        self.backgroundColor = color
        self.layer.masksToBounds = true
        self.leftViewMode = .always
    }
    
    /// Initializes the custom text field with frame.
    ///
    /// - Parameter frame: The frame to be set for the text field.
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// Required initializer which is not implemented.
    ///
    /// - Parameter coder: The decoder to be used to decode the object.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
