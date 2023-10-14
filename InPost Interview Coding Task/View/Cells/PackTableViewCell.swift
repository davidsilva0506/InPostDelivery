//
//  PackTableViewCell.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import UIKit

class PackTableViewCell: UITableViewCell {
    
    // MARK: Constants
    private enum Constants {
        
        static let horizontalSpacing: CGFloat = 20
        static let verticalSpacing: CGFloat = 16
        static let subViewHeight: CGFloat = 40
        static let spaceBetweenViews: CGFloat = 4
        
        static let shadowRadius: CGFloat = 5
        static let shadowOffsetHeight: CGFloat = 5
        static let shadowOpacity: Float = 0.1
    }

    var container = UIView()
    var divider = UIView()
    var packInfoView = PackInfoView()
    var packStatusView = PackStatusView()
    var packSenderView = PackSenderView()
    var viewMoreView = ViewMoreView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubviews()
        self.configureView()
        self.defineSubviewConstraints()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Configuration
private extension PackTableViewCell {
    
    func addSubviews() {
        
        self.container.add(self.packInfoView,
                           self.packStatusView,
                           self.packSenderView,
                           self.viewMoreView)
        
        self.contentView.add(self.divider, self.container)
    }
    
    func configureView() {

        self.selectionStyle = .none

        self.divider.backgroundColor = .backgrounColor
        
        self.addShadow()
    }
    
    func addShadow() {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = Constants.shadowRadius
        self.layer.shadowOffset = CGSize(width: 0, height: Constants.shadowOffsetHeight)
        self.layer.shadowOpacity = Constants.shadowOpacity
    }
    
    func defineSubviewConstraints() {

        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.packInfoView.translatesAutoresizingMaskIntoConstraints = false
        self.packStatusView.translatesAutoresizingMaskIntoConstraints = false
        self.packSenderView.translatesAutoresizingMaskIntoConstraints = false
        self.viewMoreView.translatesAutoresizingMaskIntoConstraints = false
        self.divider.translatesAutoresizingMaskIntoConstraints = false

        self.packInfoView.topAnchor.constraint(equalTo: self.container.topAnchor, constant: Constants.horizontalSpacing).isActive = true
        self.packInfoView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: Constants.verticalSpacing).isActive = true
        self.packInfoView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -Constants.verticalSpacing).isActive = true
        self.packInfoView.heightAnchor.constraint(equalToConstant: Constants.subViewHeight).isActive = true
        
        self.packStatusView.topAnchor.constraint(equalTo: self.packInfoView.bottomAnchor, constant: Constants.horizontalSpacing).isActive = true
        self.packStatusView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: Constants.verticalSpacing).isActive = true
        self.packStatusView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -Constants.verticalSpacing).isActive = true
        self.packStatusView.heightAnchor.constraint(equalToConstant: Constants.subViewHeight).isActive = true
        
        self.packSenderView.topAnchor.constraint(equalTo: self.packStatusView.bottomAnchor, constant: Constants.horizontalSpacing).isActive = true
        self.packSenderView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: Constants.verticalSpacing).isActive = true
        self.packSenderView.trailingAnchor.constraint(equalTo: self.viewMoreView.leadingAnchor, constant: -Constants.spaceBetweenViews).isActive = true
        self.packSenderView.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -Constants.horizontalSpacing).isActive = true
        self.packSenderView.heightAnchor.constraint(equalToConstant: Constants.subViewHeight).isActive = true

        self.viewMoreView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -Constants.verticalSpacing).isActive = true
        self.viewMoreView.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -Constants.horizontalSpacing).isActive = true
        self.viewMoreView.heightAnchor.constraint(equalToConstant: Constants.subViewHeight).isActive = true

        self.divider.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.divider.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.divider.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.divider.heightAnchor.constraint(equalToConstant: Constants.horizontalSpacing).isActive = true

        self.container.topAnchor.constraint(equalTo: self.divider.bottomAnchor).isActive = true
        self.container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
}
