//
//  NavVC.swift
//  Card_Shark_iOS
//
//  Created by Lam, Morris on 4/15/18.
//  Copyright © 2018 MorrisLam. All rights reserved.
//

import UIKit

extension UIViewController {
    public func createSpinner() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        indicator.activityIndicatorViewStyle = .gray
        let barButton = UIBarButtonItem(customView: indicator)
        self.navigationItem.setRightBarButton(barButton, animated: true)
        return indicator
    }

    @objc public func controlSpinner(willSpin: Bool, indicator: UIActivityIndicatorView) {
        if willSpin {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            indicator.startAnimating()
        } else {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            indicator.stopAnimating()
        }
    }
}
