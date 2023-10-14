//
//  ViewMoreView.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 14/10/2023.
//

import UIKit

public final class ViewMoreView: UIView {

    // MARK: Constants
    private enum Constants {

    }

    // MARK: - Properties
    var viewMoreLabel = UILabel()
    var viewMoreImageView = UIImageView()

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
private extension ViewMoreView {
    
    func addSubviews() {

        self.add(self.viewMoreLabel, self.viewMoreImageView)
    }
    
    func configureView() {
        
        self.viewMoreLabel.font = UIFont(name: "Montserrat-Bold", size: 12)
        self.viewMoreLabel.textColor = .textColor
        self.viewMoreLabel.text = "więcej"
        
        self.viewMoreImageView.clipsToBounds = true
        self.viewMoreImageView.contentMode = .scaleAspectFit
        self.viewMoreImageView.image = UIImage(named: "Arrow")
    }
    
    func defineSubviewConstraints() {
        
        self.viewMoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.viewMoreImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.viewMoreLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.viewMoreLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        self.viewMoreLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        self.viewMoreLabel.trailingAnchor.constraint(greaterThanOrEqualTo: self.viewMoreImageView.leadingAnchor, constant: -4).isActive = true

        self.viewMoreImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.viewMoreImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        self.viewMoreImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
    }
}
