//
//  EmptyView.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 12/10/2023.
//

import UIKit

public final class EmptyView: UIView {

    // MARK: Constants
    private enum Constants {

        static let titleLabelFont = "Montserrat-SemiBold"
        static let messageLabelFont = "Montserrat-Medium"
        static let titleLabelFontSize: CGFloat = 26
        static let messageLabelFontSize: CGFloat = 18
        static let messageLabelSpacing: CGFloat = 20
    }

    // MARK: - Properties
    let titleLabel = UILabel()
    let messageLabel = UILabel()

    public override init(frame: CGRect) {

        super.init(frame: frame)

        self.addSubviews()
        self.configureView()
        self.defineSubviewConstraints()
    }

    public required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public
public extension EmptyView {
    
    func configure(title: String, message: String) {
        
        self.titleLabel.text = title
        self.messageLabel.text = message
    }
}

// MARK: - Private
private extension EmptyView {
    
    func addSubviews() {

        self.add(self.titleLabel, self.messageLabel)
    }
    
    func configureView() {
        
        self.backgroundColor = .white

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.font = UIFont(name: Constants.titleLabelFont, size: Constants.titleLabelFontSize)
        self.titleLabel.textColor = .titleColor
        
        self.messageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.messageLabel.textColor = .textColor
        self.messageLabel.font = UIFont(name: Constants.messageLabelFont, size: Constants.messageLabelFontSize)
        self.messageLabel.numberOfLines = 0
        self.messageLabel.textAlignment = .center
    }
    
    func defineSubviewConstraints() {

        self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.messageLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: Constants.messageLabelSpacing).isActive = true
        self.messageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.messageLabelSpacing).isActive = true
        self.messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Constants.messageLabelSpacing).isActive = true
    }
}
