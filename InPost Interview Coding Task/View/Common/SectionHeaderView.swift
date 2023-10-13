//
//  SectionHeaderView.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 12/10/2023.
//

import UIKit

public final class SectionHeaderView: UIView {

    // MARK: Constants
    private enum Constants {

        static let titleLabelFont = "Montserrat-SemiBold"
        static let titleLabelFontSize: CGFloat = 13
        static let titleLabelWidth: CGFloat = 140
        static let horizontalSpacing: CGFloat = 20
        static let verticalSpacing: CGFloat = 16
        static let spaceBetweenViews: CGFloat = 8
        static let lineHeight: CGFloat = 1
    }

    // MARK: Properties
    let titleLabel = UILabel()
    let leftLineView = UIView()
    let rightLineView = UIView()

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

// MARK: Public
public extension SectionHeaderView {
    
    func configure(title: String) {
        
        self.titleLabel.text = title
    }
}

// MARK: Private
private extension SectionHeaderView {
    
    func addSubviews() {

        self.add(self.leftLineView, self.titleLabel, self.rightLineView)
    }
    
    func configureView() {

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.leftLineView.translatesAutoresizingMaskIntoConstraints = false
        self.rightLineView.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleLabel.font = UIFont(name: Constants.titleLabelFont, size: Constants.titleLabelFontSize)
        self.titleLabel.textColor = .sectionHeaderTitleColor
        self.titleLabel.textAlignment = .center
        
        self.leftLineView.backgroundColor = .dividerColor
        self.rightLineView.backgroundColor = .dividerColor
    }
    
    func defineSubviewConstraints() {

        self.leftLineView.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        self.leftLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.horizontalSpacing).isActive = true
        self.leftLineView.heightAnchor.constraint(equalToConstant: Constants.lineHeight).isActive = true
        self.leftLineView.trailingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor, constant: -Constants.spaceBetweenViews).isActive = true
        
        self.titleLabel.widthAnchor.constraint(equalToConstant: Constants.titleLabelWidth).isActive = true
        self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.verticalSpacing).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.rightLineView.leadingAnchor, constant: -Constants.spaceBetweenViews).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.rightLineView.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        self.rightLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.horizontalSpacing).isActive = true
        self.rightLineView.heightAnchor.constraint(equalToConstant: Constants.lineHeight).isActive = true
    }
}
