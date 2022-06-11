//
//  UIView+Extension.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 07/06/2022.
//

import Foundation
import UIKit

extension UIView{
    public func addSubViewList(_ view: UIView...) {
        view.forEach { self.addSubview($0)}
    }
    public func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
}

