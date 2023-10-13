//
//  OverlayActivityView.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import UIKit

public final class OverlayActivityView: UIView {

    // MARK: Constants
    private enum Constants {

        static let defaultOpacity: CGFloat = 0.4
    }

    // MARK: - Properties
    let activityIndicator = UIActivityIndicatorView(style: .large)

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

// MARK: - Public
public extension OverlayActivityView {
    
    static func addTo(superView: UIView) -> OverlayActivityView {

        let overlayActivityView = OverlayActivityView()

        superView.addSubview(overlayActivityView)

        overlayActivityView.pin(to: superView)

        return overlayActivityView
    }

    func showActivityOverlay() {

        self.activityIndicator.color = UIColor.gray
        self.activityIndicator.startAnimating()

        self.backgroundColor = UIColor.clear
        self.isHidden = false

        self.superview?.bringSubviewToFront(self)
    }

    func hideActivityOverlay() {

        self.isHidden = true

        self.activityIndicator.stopAnimating()
    }
}

// MARK: - Private
private extension OverlayActivityView {
    
    func addSubviews() {

        self.add(self.activityIndicator)
    }
    
    func configureView() {
        
        self.isHidden = true
        self.alpha = Constants.defaultOpacity
    }
    
    func defineSubviewConstraints() {

        self.activityIndicator.pin(to: self)
    }
}
