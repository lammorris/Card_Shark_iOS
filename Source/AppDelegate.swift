//
//  AppDelegate.swift
//  CardDeck
//
//  Created by Morris Lam on 7/28/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = setupNavigationController(with: LandingMenuViewController())
        window!.makeKeyAndVisible()

        return true
    }
}

extension AppDelegate {
    func setupNavigationController(with rootController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.barTintColor = .white
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController.navigationBar.shadowImage = UIImage()

        return navigationController
    }
}
