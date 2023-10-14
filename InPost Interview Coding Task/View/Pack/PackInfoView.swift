//
//  PackInfoView.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 14/10/2023.
//

import UIKit

public final class PackInfoView: UIView {

    // MARK: Constants
    private enum Constants {

    }

    // MARK: - Properties
    var packNumberTitleLabel = UILabel()
    var packNumberLabel = UILabel()
    var packImageView = UIImageView()

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
private extension PackInfoView {
    
    func addSubviews() {

        self.add(self.packNumberTitleLabel, self.packNumberLabel, self.packImageView)
    }
    
    func configureView() {
        
        self.packNumberTitleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 11)
        self.packNumberTitleLabel.textColor = .titleColor
        self.packNumberTitleLabel.text = "NR PRZESYŁKI"
        
        self.packNumberLabel.font = UIFont(name: "Montserrat-Medium", size: 15)
        self.packNumberLabel.textColor = .textColor
        self.packNumberLabel.numberOfLines = 0
        
        self.packImageView.clipsToBounds = true
        self.packImageView.contentMode = .scaleAspectFit
    }
    
    func defineSubviewConstraints() {

        self.packNumberTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        self.packImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.packNumberTitleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.packNumberTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.packNumberLabel.trailingAnchor.constraint(equalTo: self.packImageView.leadingAnchor).isActive = true
        
        self.packNumberLabel.topAnchor.constraint(equalTo: self.packNumberTitleLabel.bottomAnchor).isActive = true
        self.packNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.packNumberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.packNumberLabel.trailingAnchor.constraint(greaterThanOrEqualTo: self.packImageView.leadingAnchor, constant: -4).isActive = true
        
        self.packImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.packImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.packImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.packImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
