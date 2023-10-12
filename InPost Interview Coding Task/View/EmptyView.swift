//
//  EmptyView.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 12/10/2023.
//

import UIKit

public final class EmptyView: UIView {

    private enum Constants {

        
    }

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
    
    public func configure(title: String, message: String) {
        
        self.titleLabel.text = title
        self.messageLabel.text = message
    }
}

private extension EmptyView {
    
    func addSubviews() {

        self.add(self.titleLabel, self.messageLabel)
    }
    
    func configureView() {

        self.backgroundColor = .yellow

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.textColor = UIColor.black
        self.titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        self.messageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.messageLabel.textColor = UIColor.lightGray
        self.messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        self.messageLabel.numberOfLines = 0
        self.messageLabel.textAlignment = .center
    }
    
    func defineSubviewConstraints() {

        self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.messageLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20).isActive = true
        self.messageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        self.messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
    }
}
