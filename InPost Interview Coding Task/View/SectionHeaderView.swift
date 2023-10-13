//
//  SectionHeaderView.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 12/10/2023.
//

import UIKit

public final class SectionHeaderView: UIView {

    private enum Constants {

        
    }

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
    
    public func configure(title: String) {
        
        self.titleLabel.text = title
    }
}

private extension SectionHeaderView {
    
    func addSubviews() {

        self.add(self.leftLineView, self.titleLabel, self.rightLineView)
    }
    
    func configureView() {

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.leftLineView.translatesAutoresizingMaskIntoConstraints = false
        self.rightLineView.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        self.titleLabel.textColor = .sectionHeaderTitleColor
        self.titleLabel.textAlignment = .center
        
        self.leftLineView.backgroundColor = .dividerColor
        self.rightLineView.backgroundColor = .dividerColor
    }
    
    func defineSubviewConstraints() {

        self.leftLineView.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        self.leftLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        self.leftLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        self.leftLineView.trailingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor, constant: -8).isActive = true
        
        self.titleLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.rightLineView.leadingAnchor, constant: -8).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.rightLineView.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        self.rightLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        self.rightLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
