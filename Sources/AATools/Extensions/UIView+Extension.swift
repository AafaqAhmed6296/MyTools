//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import Foundation
import UIKit

public struct AnchoredConstraints {
   public var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

extension UIView {
    
    public func magicallySetCornerRadius() {
        layer.cornerRadius = 0.188 * min(frame.width, frame.height)
        layer.masksToBounds = true
    }
    
    @discardableResult
    public
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                              leading: NSLayoutXAxisAnchor? = nil,
                              bottom: NSLayoutYAxisAnchor? = nil,
                              trailing: NSLayoutXAxisAnchor? = nil,
                              paddingTop: CGFloat = 0,
                              paddingLeft: CGFloat = 0,
                              paddingBottom: CGFloat = 0,
                              paddingRight: CGFloat = 0,
                              width: CGFloat? = nil,
                              height: CGFloat? = nil) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: paddingTop)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: paddingLeft)        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -paddingRight)
        }
        
        if let width = width {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: width)
        }
        
        if let height = height {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true}
        
        return anchoredConstraints
    }
    
    public func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    public func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    public func centerY(inView view: UIView, leadingAnchor: NSLayoutXAxisAnchor? = nil,
                               paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let leading = leadingAnchor {
            anchor(leading: leading, paddingLeft: paddingLeft)
        }
    }
    
    @discardableResult
    public func setDimensions(height: CGFloat, width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    public func setHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    public func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    public func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    public func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = true
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension UIView {
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }

    public var left: CGFloat {
        return frame.origin.x
    }

    public var bottom: CGFloat {
        return top + height
    }

    public var right: CGFloat {
        return left + width
    }
}

extension UIView {
    fileprivate func _stack(_ axis: NSLayoutConstraint.Axis = .vertical, views: [UIView], spacing: CGFloat=0, alignment: UIStackView.Alignment=.fill, distribution: UIStackView.Distribution=.fill) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.distribution = distribution
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.spacing = 0
        addSubview(stackView)
        stackView.fillSuperview()
        return stackView
    }
    
    @discardableResult
    public func stack(_ views: UIView..., spacing: CGFloat=0, alignment: UIStackView.Alignment=.fill, distribution: UIStackView.Distribution=.fill) -> UIStackView {
        return _stack(.vertical,views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
    @discardableResult
    public func hstack(_ views: UIView..., spacing: CGFloat=0, alignment: UIStackView.Alignment=.fill, distribution: UIStackView.Distribution=.fill) -> UIStackView {
        return _stack(.horizontal,views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
}
