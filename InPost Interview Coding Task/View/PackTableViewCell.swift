//
//  PackTableViewCell.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import UIKit

class PackTableViewCell: UITableViewCell {
    
    var container = UIView()
    var packInfoContainer = UIView()
    var packStatusContainer = UIView()
    var packSenderContainer = UIView()
    var viewMoreContainer = UIView()
    var topDivider = UIView()
    var bottomDivider = UIView()

    var packNumberTitleLabel = UILabel()
    var packNumberLabel = UILabel()
    var packStatusTitleLabel = UILabel()
    var packStatusLabel = UILabel()
    var packDateTitleLabel = UILabel()
    var packDateLabel = UILabel()
    var packSenderTitleLabel = UILabel()
    var packSenderLabel = UILabel()
    var viewMoreLabel = UILabel()
    
    var packImageView = UIImageView()
    var viewMoreImageView = UIImageView()

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
        
        self.packInfoContainer.add(self.packNumberTitleLabel, self.packNumberLabel, self.packImageView)
        self.packStatusContainer.add(self.packStatusTitleLabel, self.packStatusLabel, self.packDateTitleLabel, packDateLabel)
        self.packSenderContainer.add(self.packSenderTitleLabel, self.packSenderLabel)
        self.viewMoreContainer.add(self.viewMoreLabel, self.viewMoreImageView)
        
        self.container.add(self.packInfoContainer,
                           self.packStatusContainer,
                           self.packSenderContainer,
                           self.viewMoreContainer)
        
        self.contentView.add(self.topDivider, self.container)
    }
    
    func configureView() {

        self.selectionStyle = .none
        
        self.packNumberTitleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 11)
        self.packStatusTitleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 11)
        self.packSenderTitleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 11)
        self.packDateTitleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 11)
        self.packNumberTitleLabel.textColor = .titleColor
        self.packStatusTitleLabel.textColor = .titleColor
        self.packSenderTitleLabel.textColor = .titleColor
        self.packDateTitleLabel.textColor = .titleColor
        
        self.packImageView.clipsToBounds = true
        self.packImageView.contentMode = .scaleAspectFit
        
        self.packNumberLabel.font = UIFont(name: "Montserrat-Medium", size: 15)
        self.packStatusLabel.font = UIFont(name: "Montserrat-Bold", size: 15)
        self.packSenderLabel.font = UIFont(name: "Montserrat-Bold", size: 15)
        self.packDateLabel.font = UIFont(name: "Montserrat-Medium", size: 15)
        self.packNumberLabel.textColor = .textColor
        self.packStatusLabel.textColor = .textColor
        self.packSenderLabel.textColor = .textColor
        self.packDateLabel.textColor = .textColor
        self.packDateLabel.textAlignment = .right
        self.packNumberLabel.numberOfLines = 0
        self.packStatusLabel.numberOfLines = 0
        self.packSenderLabel.numberOfLines = 0
        
        self.viewMoreLabel.font = UIFont(name: "Montserrat-Bold", size: 12)
        self.viewMoreLabel.textColor = .textColor
        self.viewMoreImageView.clipsToBounds = true
        self.viewMoreImageView.contentMode = .scaleAspectFit
        
        self.packNumberTitleLabel.text = "NR PRZESYŁKI"
        self.packStatusTitleLabel.text = "STATUS"
        self.packSenderTitleLabel.text = "NADAWCA"
        
        self.viewMoreLabel.text = "więcej"
        self.viewMoreImageView.image = UIImage(named: "Arrow")

        self.topDivider.backgroundColor = .backgrounColor
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 0.1
    }
    
    func defineSubviewConstraints() {

        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.packInfoContainer.translatesAutoresizingMaskIntoConstraints = false
        self.packStatusContainer.translatesAutoresizingMaskIntoConstraints = false
        self.packSenderContainer.translatesAutoresizingMaskIntoConstraints = false
        self.viewMoreContainer.translatesAutoresizingMaskIntoConstraints = false

        self.packImageView.translatesAutoresizingMaskIntoConstraints = false
        self.packNumberTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packStatusTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packDateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packDateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packSenderTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packSenderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.viewMoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.viewMoreImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.topDivider.translatesAutoresizingMaskIntoConstraints = false
        self.bottomDivider.translatesAutoresizingMaskIntoConstraints = false
        
        //Pack Info
        self.packNumberTitleLabel.topAnchor.constraint(equalTo: self.packInfoContainer.topAnchor).isActive = true
        self.packNumberTitleLabel.leadingAnchor.constraint(equalTo: self.packInfoContainer.leadingAnchor).isActive = true
        self.packNumberLabel.trailingAnchor.constraint(equalTo: self.packImageView.leadingAnchor).isActive = true
        
        self.packNumberLabel.topAnchor.constraint(equalTo: self.packNumberTitleLabel.bottomAnchor).isActive = true
        self.packNumberLabel.leadingAnchor.constraint(equalTo: self.packInfoContainer.leadingAnchor).isActive = true
        self.packNumberLabel.bottomAnchor.constraint(equalTo: self.packInfoContainer.bottomAnchor).isActive = true
        self.packNumberLabel.trailingAnchor.constraint(greaterThanOrEqualTo: self.packImageView.leadingAnchor, constant: -4).isActive = true
        
        self.packImageView.topAnchor.constraint(equalTo: self.packInfoContainer.topAnchor).isActive = true
        self.packImageView.trailingAnchor.constraint(equalTo: self.packInfoContainer.trailingAnchor).isActive = true
        self.packImageView.bottomAnchor.constraint(equalTo: self.packInfoContainer.bottomAnchor).isActive = true
        self.packImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Pack Status
        self.packStatusTitleLabel.topAnchor.constraint(equalTo: self.packStatusContainer.topAnchor).isActive = true
        self.packStatusTitleLabel.leadingAnchor.constraint(equalTo: self.packStatusContainer.leadingAnchor).isActive = true
        
        self.packStatusLabel.topAnchor.constraint(equalTo: self.packStatusTitleLabel.bottomAnchor).isActive = true
        self.packStatusLabel.leadingAnchor.constraint(equalTo: self.packStatusContainer.leadingAnchor).isActive = true
        self.packStatusLabel.bottomAnchor.constraint(equalTo: self.packStatusContainer.bottomAnchor).isActive = true
        self.packStatusLabel.trailingAnchor.constraint(equalTo: self.packDateLabel.leadingAnchor, constant: -4).isActive = true
        
        self.packDateTitleLabel.topAnchor.constraint(equalTo: self.packStatusContainer.topAnchor).isActive = true
        self.packDateTitleLabel.trailingAnchor.constraint(equalTo: self.packStatusContainer.trailingAnchor).isActive = true
        
        self.packDateLabel.topAnchor.constraint(equalTo: self.packDateTitleLabel.bottomAnchor).isActive = true
        self.packDateLabel.trailingAnchor.constraint(equalTo: self.packStatusContainer.trailingAnchor).isActive = true
        
        //Pack Sender
        self.packSenderTitleLabel.topAnchor.constraint(equalTo: self.packSenderContainer.topAnchor).isActive = true
        self.packSenderTitleLabel.leadingAnchor.constraint(equalTo: self.packSenderContainer.leadingAnchor).isActive = true
        
        self.packSenderLabel.topAnchor.constraint(equalTo: self.packSenderTitleLabel.bottomAnchor).isActive = true
        self.packSenderLabel.leadingAnchor.constraint(equalTo: self.packSenderContainer.leadingAnchor).isActive = true
        self.packSenderLabel.bottomAnchor.constraint(equalTo: self.packSenderContainer.bottomAnchor).isActive = true
        
        //View more
        self.viewMoreLabel.leadingAnchor.constraint(equalTo: self.viewMoreContainer.leadingAnchor).isActive = true
        self.viewMoreLabel.topAnchor.constraint(equalTo: self.viewMoreContainer.topAnchor, constant: 4).isActive = true
        self.viewMoreLabel.bottomAnchor.constraint(equalTo: self.viewMoreContainer.bottomAnchor, constant: -4).isActive = true
        self.viewMoreLabel.trailingAnchor.constraint(greaterThanOrEqualTo: self.viewMoreImageView.leadingAnchor, constant: -4).isActive = true

        self.viewMoreImageView.trailingAnchor.constraint(equalTo: self.viewMoreContainer.trailingAnchor).isActive = true
        self.viewMoreImageView.topAnchor.constraint(equalTo: self.viewMoreContainer.topAnchor, constant: 4).isActive = true
        self.viewMoreImageView.bottomAnchor.constraint(equalTo: self.viewMoreContainer.bottomAnchor, constant: -4).isActive = true
        
        //Containers
        self.packInfoContainer.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 16).isActive = true
        self.packInfoContainer.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 20).isActive = true
        self.packInfoContainer.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -20).isActive = true
        self.packInfoContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.packStatusContainer.topAnchor.constraint(equalTo: self.packInfoContainer.bottomAnchor, constant: 16).isActive = true
        self.packStatusContainer.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 20).isActive = true
        self.packStatusContainer.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -20).isActive = true
        self.packStatusContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.packSenderContainer.topAnchor.constraint(equalTo: self.packStatusContainer.bottomAnchor, constant: 16).isActive = true
        self.packSenderContainer.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 20).isActive = true
        self.packSenderContainer.trailingAnchor.constraint(equalTo: self.viewMoreContainer.leadingAnchor, constant: -4).isActive = true
        self.packSenderContainer.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -16).isActive = true
        self.packSenderContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true

        self.viewMoreContainer.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -20).isActive = true
        self.viewMoreContainer.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -16).isActive = true
        self.viewMoreContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true

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
