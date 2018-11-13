//
//  AppDelegate.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 10/19/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootVC = SPStoryboardFactory.instantiateInitialViewController(.launch, as: LaunchViewController.self)
        window?.rootViewController = rootVC
        window?.tintColor = UIColor.twilightBlue //sets the tint color

        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = UIColor.red
        }
        UIApplication.shared.statusBarStyle = .lightContent
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

