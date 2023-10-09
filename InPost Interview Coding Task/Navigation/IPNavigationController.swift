//
//  IPNavigationController.swift
//  InPost Interview Coding Task
//
//  Created by Damian Piwowarski on 03/11/2022.
//

import UIKit

private enum Constants {

    static let fontSize: CGFloat = 15
}

class IPNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundEffect = nil
        appearance.backgroundColor = .systemBackground
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: Constants.fontSize, weight: .bold)
        ]
        
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}
