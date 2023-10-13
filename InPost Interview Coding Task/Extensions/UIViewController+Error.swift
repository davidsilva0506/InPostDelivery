//
//  UIVI.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 13/10/2023.
//

import UIKit

public extension UIViewController {

    private enum Constants {
    
        static let errorTitle = "Oops"
        static let errorMessage = "Something went wrong"
        static let buttonTitle = "Dismiss"
    }
    
    func showGenericError() {

        let alert = UIAlertController(title: Constants.errorTitle, message: Constants.errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.buttonTitle, style: .destructive))
        
        self.present(alert, animated: true)
    }
}
