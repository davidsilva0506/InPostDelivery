//
//  PackTableViewCell.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import UIKit

class PackTableViewCell: UITableViewCell {
    
    var packInfoContainer = UIView()
    var packStatusContainer = UIView()
    var packSenderContainer = UIView()

    var packNumberTitleLabel = UILabel()
    var packNumberLabel = UILabel()
    var packStatusTitleLabel = UILabel()
    var packStatusLabel = UILabel()
    var packSenderTitleLabel = UILabel()
    var packSenderLabel = UILabel()
    
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

// MARK: - Cell Configure
extension PackTableViewCell {

    func configure(pack: Pack) {
        
        self.packNumberTitleLabel.text = "NR PRZESYŁKI"
        self.packStatusTitleLabel.text = "STATUS"
        self.packSenderTitleLabel.text = "NADAWCA"

        self.packNumberLabel.text = pack.id
        self.packStatusLabel.text = pack.status.text
        self.packSenderLabel.text = pack.sender
    }
}

// MARK: - View Configuration
private extension PackTableViewCell {
    
    func addSubviews() {
        
        self.packInfoContainer.add(self.packNumberTitleLabel, self.packNumberLabel)
        
        self.packStatusContainer.add(self.packStatusTitleLabel, self.packStatusLabel)
        
        self.packSenderContainer.add(self.packSenderTitleLabel, self.packSenderLabel)
        
        self.contentView.add(self.packInfoContainer, self.packStatusContainer, self.packSenderContainer)
    }
    
    func configureView() {

        self.selectionStyle = .none
    }
    
    func defineSubviewConstraints() {

        self.packInfoContainer.translatesAutoresizingMaskIntoConstraints = false
        self.packStatusContainer.translatesAutoresizingMaskIntoConstraints = false
        self.packSenderContainer.translatesAutoresizingMaskIntoConstraints = false

        self.packNumberTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packStatusTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packSenderTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packSenderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Pack Info
        self.packNumberTitleLabel.topAnchor.constraint(equalTo: self.packInfoContainer.topAnchor).isActive = true
        self.packNumberTitleLabel.leadingAnchor.constraint(equalTo: self.packInfoContainer.leadingAnchor).isActive = true
        
        self.packNumberLabel.topAnchor.constraint(equalTo: self.packNumberTitleLabel.bottomAnchor).isActive = true
        self.packNumberLabel.leadingAnchor.constraint(equalTo: self.packInfoContainer.leadingAnchor).isActive = true
        self.packNumberLabel.bottomAnchor.constraint(equalTo: self.packInfoContainer.bottomAnchor).isActive = true
        
        //Pack Status
        self.packStatusTitleLabel.topAnchor.constraint(equalTo: self.packStatusContainer.topAnchor).isActive = true
        self.packStatusTitleLabel.leadingAnchor.constraint(equalTo: self.packStatusContainer.leadingAnchor).isActive = true
        
        self.packStatusLabel.topAnchor.constraint(equalTo: self.packStatusTitleLabel.bottomAnchor).isActive = true
        self.packStatusLabel.leadingAnchor.constraint(equalTo: self.packStatusContainer.leadingAnchor).isActive = true
        self.packStatusLabel.bottomAnchor.constraint(equalTo: self.packStatusContainer.bottomAnchor).isActive = true
        
        //Pack Sender
        self.packSenderTitleLabel.topAnchor.constraint(equalTo: self.packSenderContainer.topAnchor).isActive = true
        self.packSenderTitleLabel.leadingAnchor.constraint(equalTo: self.packSenderContainer.leadingAnchor).isActive = true
        
        self.packSenderLabel.topAnchor.constraint(equalTo: self.packSenderTitleLabel.bottomAnchor).isActive = true
        self.packSenderLabel.leadingAnchor.constraint(equalTo: self.packSenderContainer.leadingAnchor).isActive = true
        self.packSenderLabel.bottomAnchor.constraint(equalTo: self.packSenderContainer.bottomAnchor).isActive = true
        
        //Containers
        self.packInfoContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        self.packInfoContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        self.packInfoContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
        
        self.packStatusContainer.topAnchor.constraint(equalTo: self.packInfoContainer.bottomAnchor, constant: 16).isActive = true
        self.packStatusContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        self.packStatusContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
        
        self.packSenderContainer.topAnchor.constraint(equalTo: self.packStatusContainer.bottomAnchor, constant: 16).isActive = true
        self.packSenderContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        self.packSenderContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
        self.packSenderContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
    }
}
