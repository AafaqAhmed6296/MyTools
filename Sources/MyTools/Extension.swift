
/// My Tools made for ease.

import UIKit
import JGProgressHUD

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UITabBar {
    
    /// Set the bar transparent
    static public func setTransparentTabBar() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
    }
}

extension UIImageView {
    public func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}


extension UIViewController {
    
    static let hud = JGProgressHUD(style: .dark)
    
    func showHUD(_ show: Bool, withTitle title: String?, error: Error?) {
        view.endEditing(true)
        
        if let err = error {
            UIViewController.hud.textLabel.text = title
            UIViewController.hud.detailTextLabel.text = err.localizedDescription
            UIViewController.hud.show(in: view)
            UIViewController.hud.dismiss(afterDelay: 4)
        }
        else if let title = title {
            UIViewController.hud.textLabel.text = title
            UIViewController.hud.show(in: view)
        }
        else if show {
            UIViewController.hud.show(in: view)
        }else {
            UIViewController.hud.dismiss(animated: true)
        }
    }
    
    public func showMessage(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    public func showMessage(withTitle title: String, action1Title: String, action2Title: String? = nil, message: String, completion: @escaping(UIAlertAction) -> Void ) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: action1Title, style: .default, handler: action2Title == nil ? completion : nil)
        
        alert.addAction(action1)
        
        if action2Title != nil {
            let action2 = UIAlertAction(title: action2Title, style: .default, handler: completion)
            alert.addAction(action2)
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
    public func setupTwoColorGradientLayer(withColors colors: [Any]?, locations: [NSNumber]?, gradientLayers: inout CAGradientLayer?) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        view.layer.addSublayer(gradientLayer)
        gradientLayer.frame = view.bounds
        gradientLayers = gradientLayer
    }
    
    /// This will clear all text fields in the view
    public  func clearAllTexts(){
        for view in self.view.subviews{
            if view is UITextField{
                let field: UITextField = view as! UITextField
                field.text = ""
            }
        }
    }
    
}

extension UIButton {
    
    public func attributedTitle(firstRegularString: String, secondBoldString: String) {
        
        let atts : [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                    .font: UIFont.systemFont(ofSize: 16)]
        
        let attributedTitle = NSMutableAttributedString(string: "\(firstRegularString) ", attributes: atts)
        
        let boldAtts : [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                        .font: UIFont.boldSystemFont(ofSize: 16)]
        attributedTitle.append(NSAttributedString(string: secondBoldString, attributes: boldAtts))
        
        setAttributedTitle(attributedTitle, for: .normal)
    }
}

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

public struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
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
    
    public func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    public func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    public func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
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




