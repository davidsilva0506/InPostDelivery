//
//  PackTableViewCell.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import UIKit

class PackTableViewCell: UITableViewCell {
    
    var container = UIView()
    var packInfoView = PackInfoView()
    var packStatusView = PackStatusView()
    var packSenderView = PackSenderView()
    var viewMoreView = ViewMoreView()
    var topDivider = UIView()
    var bottomDivider = UIView()

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
        
        self.contentView.add(self.topDivider, self.container)
    }
    
    func configureView() {

        self.selectionStyle = .none

        self.topDivider.backgroundColor = .backgrounColor
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 0.1
    }
    
    func defineSubviewConstraints() {

        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.packInfoView.translatesAutoresizingMaskIntoConstraints = false
        self.packStatusView.translatesAutoresizingMaskIntoConstraints = false
        self.packSenderView.translatesAutoresizingMaskIntoConstraints = false
        self.viewMoreView.translatesAutoresizingMaskIntoConstraints = false
        
        self.topDivider.translatesAutoresizingMaskIntoConstraints = false
        self.bottomDivider.translatesAutoresizingMaskIntoConstraints = false

        self.packInfoView.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 16).isActive = true
        self.packInfoView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 20).isActive = true
        self.packInfoView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -20).isActive = true
        self.packInfoView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.packStatusView.topAnchor.constraint(equalTo: self.packInfoView.bottomAnchor, constant: 16).isActive = true
        self.packStatusView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 20).isActive = true
        self.packStatusView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -20).isActive = true
        self.packStatusView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.packSenderView.topAnchor.constraint(equalTo: self.packStatusView.bottomAnchor, constant: 16).isActive = true
        self.packSenderView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 20).isActive = true
        self.packSenderView.trailingAnchor.constraint(equalTo: self.viewMoreView.leadingAnchor, constant: -4).isActive = true
        self.packSenderView.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -16).isActive = true
        self.packSenderView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        self.viewMoreView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -20).isActive = true
        self.viewMoreView.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -16).isActive = true
        self.viewMoreView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        self.topDivider.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.topDivider.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.topDivider.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.topDivider.heightAnchor.constraint(equalToConstant: 16).isActive = true

        self.container.topAnchor.constraint(equalTo: self.topDivider.bottomAnchor).isActive = true
        self.container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
}

extension UIColor {
    
    public static let titleColor = UIColor(red: 64/255, green: 64/255, blue: 65/255, alpha: 1.0)
    public static let textColor = UIColor(red: 146/255, green: 148/255, blue: 151/255, alpha: 1.0)
    public static let backgrounColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1.0)
    public static let dividerColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1.0)
    public static let sectionHeaderTitleColor = UIColor(red: 187/255, green: 189/255, blue: 191/255, alpha: 1.0)
}
