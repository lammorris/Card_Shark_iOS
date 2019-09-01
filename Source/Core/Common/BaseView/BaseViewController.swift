//
//  BaseViewController.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

class BaseViewController<T: UIView>: UIViewController {

    // MARK: - Properties

    var rootView: T {
        return view as! T
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func loadView() {
        view = T(frame: UIScreen.main.bounds)
    }
}
