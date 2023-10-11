//
//  UIViewController+Util.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import UIKit

public extension UIViewController {

    func showActivityOverlay() {

        let activityOverlay = self.activityOverlayView() ?? OverlayActivityView.addTo(superView: self.view)

        activityOverlay.showActivityOverlay()
    }

    func hideActivityOverlay() {

        self.activityOverlayView()?.hideActivityOverlay()
    }
}

private extension UIViewController {

    func overlayActivityParentView() -> UIView {

        return self.view
    }

    func activityOverlayView() -> OverlayActivityView? {

        return self.overlayActivityParentView().subviews.first { $0 is OverlayActivityView } as? OverlayActivityView
    }
}
