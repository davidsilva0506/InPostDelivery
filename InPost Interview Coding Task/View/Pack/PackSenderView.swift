//
//  PackSenderView.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 14/10/2023.
//

import UIKit

public final class PackSenderView: UIView {

    // MARK: Constants
    private enum Constants {

        static let titleFontName = "Montserrat-SemiBold"
        static let titleFontSize: CGFloat = 11
        static let title = "NADAWCA"
        
        static let valueFontName = "Montserrat-Bold"
        static let valueFontSize: CGFloat = 15
    }

    // MARK: - Properties
    var packSenderTitleLabel = UILabel()
    var packSenderLabel = UILabel()

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
private extension PackSenderView {
    
    func addSubviews() {

        self.add(self.packSenderTitleLabel, self.packSenderLabel)
    }
    
    func configureView() {
        
        self.packSenderTitleLabel.font = UIFont(name: Constants.titleFontName, size: Constants.titleFontSize)
        self.packSenderTitleLabel.textColor = .titleColor
        self.packSenderTitleLabel.text = Constants.title

        self.packSenderLabel.font = UIFont(name: Constants.valueFontName, size: Constants.valueFontSize)
        self.packSenderLabel.textColor = .textColor
        self.packSenderLabel.numberOfLines = 0
    }
    
    func defineSubviewConstraints() {

        self.packSenderTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packSenderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.packSenderTitleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.packSenderTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        self.packSenderLabel.topAnchor.constraint(equalTo: self.packSenderTitleLabel.bottomAnchor).isActive = true
        self.packSenderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.packSenderLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
