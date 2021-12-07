//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import UIKit

extension UINavigationController {
  public func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}
