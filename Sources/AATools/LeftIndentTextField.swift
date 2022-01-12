//
//  LeftIndentTextField.swift
//  
//
//  Created by Aafaq on 12/01/2022.
//

import UIKit

public
class LeftIndentTextField: UITextField {
    
    init(leftSpacing: CGFloat = 12, color: UIColor = .white) {
        super.init(frame: .zero)
        
        let leftView = UIView()
        leftView.setDimensions(height: 12, width: 12)
        leftView.backgroundColor = color
        self.leftView = leftView
        self.backgroundColor = color
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
