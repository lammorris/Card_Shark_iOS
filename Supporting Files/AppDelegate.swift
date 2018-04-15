//
//  AppDelegate.swift
//  Card_Shark_iOS
//
//  Created by Lam, Morris on 4/14/18.
//  Copyright © 2018 MorrisLam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UINavigationBar.appearance().prefersLargeTitles = true
        return true
    }
}

