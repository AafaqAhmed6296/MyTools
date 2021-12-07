//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//


import UIKit
import JGProgressHUD

extension UIViewController {
    
    public static let hud = JGProgressHUD(style: .dark)
    public static let dismissHud = JGProgressHUD(style: .dark)
    public static let selfDismissHud = JGProgressHUD(style: .dark)
    
    public func showHUD(_ show: Bool, withTitle title: String? = nil, error: Error? = nil) {
        view.endEditing(true)
        
        if let err = error {
            UIViewController.dismissHud.textLabel.text = title
            UIViewController.dismissHud.detailTextLabel.text = err.localizedDescription
            UIViewController.dismissHud.show(in: view)
            UIViewController.dismissHud.dismiss(afterDelay: 4)
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
    
    public func selfDismissHud(withTitle title: String, delay: TimeInterval = 2) {
        UIViewController.selfDismissHud.textLabel.text = title
        UIViewController.selfDismissHud.show(in: view)
        UIViewController.selfDismissHud.dismiss(afterDelay: delay)
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
    public  func clearAllTextFields(){
        for view in self.view.subviews{
            if view is UITextField{
                let field: UITextField = view as! UITextField
                field.text = ""
            }else if view is UIStackView {
                for stackSubView in (view as! UIStackView).arrangedSubviews{
                    if stackSubView is UITextField {
                        let field: UITextField = stackSubView as! UITextField
                        field.text = ""
                    }
                }
            }
        }
    }
}
