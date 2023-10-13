//
//  UIView+Extension.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import UIKit

// MARK: - Pin
extension UIView {
    
    func pin(to superView: UIView) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

// MARK: - Subviews
public extension UIView {

    func add(_ subviews: UIView...) {

        subviews.forEach(self.addSubview)
    }

    func removeAllSubviews() {

        for view in subviews { view.removeFromSuperview() }
    }
}
