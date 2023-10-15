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

        static let titleFontName = "Montserrat-SemiBold"
        static let titleFontSize: CGFloat = 11
        static let title = "STATUS"
        
        static let valueFontName = "Montserrat-Bold"
        static let valueFontSize: CGFloat = 15
        
        static let dateValueFontName = "Montserrat-Medium"
        
        static let horizontalSpacing: CGFloat = 4
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
        
        self.packStatusTitleLabel.font = UIFont(name: Constants.titleFontName, size: Constants.titleFontSize)
        self.packStatusTitleLabel.textColor = .titleColor
        self.packStatusTitleLabel.text = Constants.title
        
        self.packStatusLabel.font = UIFont(name: Constants.valueFontName, size: Constants.valueFontSize)
        self.packStatusLabel.textColor = .textColor
        self.packStatusLabel.numberOfLines = 0
        
        self.packDateTitleLabel.font = UIFont(name: Constants.titleFontName, size: Constants.titleFontSize)
        self.packDateTitleLabel.textColor = .titleColor
        
        self.packDateLabel.font = UIFont(name: Constants.dateValueFontName, size: Constants.valueFontSize)
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
        self.packStatusLabel.trailingAnchor.constraint(equalTo: self.packDateLabel.leadingAnchor, constant: -Constants.horizontalSpacing).isActive = true
        
        self.packDateTitleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.packDateTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        self.packDateLabel.topAnchor.constraint(equalTo: self.packDateTitleLabel.bottomAnchor).isActive = true
        self.packDateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
