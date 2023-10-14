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

        static let fontName = "Montserrat-Bold"
        static let fontSize: CGFloat = 12

        static let viewMore = "więcej"
        
        static let imageName = "Arrow"
        
        static let horizontalSpacing: CGFloat = 4
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
        
        self.viewMoreLabel.font = UIFont(name: Constants.fontName, size: Constants.fontSize)
        self.viewMoreLabel.textColor = .textColor
        self.viewMoreLabel.text = Constants.viewMore
        
        self.viewMoreImageView.clipsToBounds = true
        self.viewMoreImageView.contentMode = .scaleAspectFit
        self.viewMoreImageView.image = UIImage(named: Constants.imageName)
    }
    
    func defineSubviewConstraints() {
        
        self.viewMoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.viewMoreImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.viewMoreLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.viewMoreLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.horizontalSpacing).isActive = true
        self.viewMoreLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.horizontalSpacing).isActive = true
        self.viewMoreLabel.trailingAnchor.constraint(greaterThanOrEqualTo: self.viewMoreImageView.leadingAnchor,
                                                     constant: -Constants.horizontalSpacing).isActive = true

        self.viewMoreImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.viewMoreImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.horizontalSpacing).isActive = true
        self.viewMoreImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.horizontalSpacing).isActive = true
    }
}
