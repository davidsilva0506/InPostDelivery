//
//  UIVI.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 13/10/2023.
//

import UIKit

public extension UIViewController {

    func showGenericError() {

        let alert = UIAlertController(title: "Oops", message: "Something went wrong", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive))
        
        self.present(alert, animated: true)
    }
}

