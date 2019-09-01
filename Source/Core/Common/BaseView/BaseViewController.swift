//
//  BaseViewController.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

class BaseViewController<RootViewType: UIView>: UIViewController {

    // MARK: - Properties

    var rootView: RootViewType {
        return view as! RootViewType
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func loadView() {
        view = RootViewType(frame: UIScreen.main.bounds)
    }
}
