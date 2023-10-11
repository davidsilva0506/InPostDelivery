//
//  OverlayActivityView.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import UIKit

public final class OverlayActivityView: UIView {

    private enum Constants {

        static let defaultOpacity: CGFloat = 0.4
    }

    let activityIndicator = UIActivityIndicatorView(style: .large)

    public override init(frame: CGRect) {

        super.init(frame: frame)

        self.isHidden = true
        self.alpha = Constants.defaultOpacity

        self.addSubview(self.activityIndicator)

        self.activityIndicator.pin(to: self)
    }

    public required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }

    public static func addTo(superView: UIView) -> OverlayActivityView {

        let overlayActivityView = OverlayActivityView()

        superView.addSubview(overlayActivityView)

        overlayActivityView.pin(to: superView)

        return overlayActivityView
    }

    public func showActivityOverlay() {

        self.activityIndicator.color = UIColor.gray
        self.activityIndicator.startAnimating()

        self.backgroundColor = UIColor.clear
        self.isHidden = false

        self.superview?.bringSubviewToFront(self)
    }

    public func hideActivityOverlay() {

        self.isHidden = true

        self.activityIndicator.stopAnimating()
    }
}
