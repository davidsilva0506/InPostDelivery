//
//  PackStatusView.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 14/10/2023.
//

import UIKit

public final class PackStatusView: UIView {

    // MARK: Constants
    private enum Constants {

    }

    // MARK: - Properties
    var packStatusTitleLabel = UILabel()
    var packStatusLabel = UILabel()
    var packDateTitleLabel = UILabel()
    var packDateLabel = UILabel()

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

// MARK: - Private
private extension PackStatusView {
    
    func addSubviews() {

        self.add(self.packStatusTitleLabel,
                 self.packStatusLabel,
                 self.packDateTitleLabel,
                 self.packDateLabel)
    }
    
    func configureView() {
        
        self.packStatusTitleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 11)
        self.packStatusTitleLabel.textColor = .titleColor
        self.packStatusTitleLabel.text = "STATUS"
        
        self.packStatusLabel.font = UIFont(name: "Montserrat-Bold", size: 15)
        self.packStatusLabel.textColor = .textColor
        self.packStatusLabel.numberOfLines = 0
        
        self.packDateTitleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 11)
        self.packDateTitleLabel.textColor = .titleColor
        
        self.packDateLabel.font = UIFont(name: "Montserrat-Medium", size: 15)
        self.packDateLabel.textColor = .textColor
        self.packDateLabel.textAlignment = .right
    }
    
    func defineSubviewConstraints() {
        
        self.packStatusTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packDateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.packStatusTitleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.packStatusTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        self.packStatusLabel.topAnchor.constraint(equalTo: self.packStatusTitleLabel.bottomAnchor).isActive = true
        self.packStatusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.packStatusLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.packStatusLabel.trailingAnchor.constraint(equalTo: self.packDateLabel.leadingAnchor, constant: -4).isActive = true
        
        self.packDateTitleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.packDateTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        self.packDateLabel.topAnchor.constraint(equalTo: self.packDateTitleLabel.bottomAnchor).isActive = true
        self.packDateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
