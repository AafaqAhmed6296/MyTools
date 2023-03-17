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
    
    /// Anchors a view to its superview with specified constraints and returns the anchored constraints.
    /// - Parameters:
    ///   - top: The top anchor of the view to anchor to its superview.
    ///   - leading: The leading anchor of the view to anchor to its superview.
    ///   - bottom: The bottom anchor of the view to anchor to its superview.
    ///   - trailing: The trailing anchor of the view to anchor to its superview.
    ///   - paddingTop: The top padding of the view from its top anchor.
    ///   - paddingLeft: The left padding of the view from its leading anchor.
    ///   - paddingBottom: The bottom padding of the view from its bottom anchor.
    ///   - paddingRight: The right padding of the view from its trailing anchor.
    ///   - width: The width of the view.
    ///   - height: The height of the view.
    /// - Returns: The constraints that anchor the view to its superview.
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
    
    /// Centers the view horizontally and vertically in the specified view.
    ///
    /// - Parameters:
    ///   - view: The view in which the current view will be centered.
    ///   - yConstant: The optional constant value to adjust the vertical centering.
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
    
    
    /// Sets the height of view and return a view with settled height
    /// - Parameter height: value you want to set for view's height
    /// - Returns: A UIView with the setlled height value.
    @discardableResult
    public func setHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    /// Sets the width of view and return a view with settled width
    /// - Parameter width: value you want to set for view's width
    /// - Returns: A UIView with the setlled width value.
    @discardableResult
    public func setWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    /// Fill the view to it's superview.
    /// - Parameter padding: padding you want's from the sides of superview.
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

//MARK: - Measurement Values
extension UIView {
    
    /// Get the width of view
    public var width: CGFloat {
        return frame.size.width
    }
    
    /// Get the height of view
    public var height: CGFloat {
        return frame.size.height
    }
    
    /// Get the top y value of view
    public var top: CGFloat {
        return frame.origin.y
    }
    
    /// Get the left x value of view
    public var left: CGFloat {
        return frame.origin.x
    }
    
    /// Get the bottom y value of view
    public var bottom: CGFloat {
        return top + height
    }
    
    /// Get the right x value of view
    public var right: CGFloat {
        return left + width
    }
}

//MARK: - Stacking
extension UIView {
    fileprivate func _stack(_ axis: NSLayoutConstraint.Axis = .vertical, views: [UIView], spacing: CGFloat=0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.distribution = distribution
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.spacing = spacing
        addSubview(stackView)
        stackView.fillSuperview()
        return stackView
    }
    
    @discardableResult
    public func stack(_ views: UIView..., spacing: CGFloat=0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.vertical,views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
    @discardableResult
    public func hstack(_ views: UIView..., spacing: CGFloat=0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.horizontal,views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
}
