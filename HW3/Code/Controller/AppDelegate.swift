//
//  AppDelegate.swift
//  HW3
//
//  Created by Арслан on 24.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: TCTabBarController())
        
//        UITabBar.appearance().backgroundColor = UIColor(red:1, green:0, blue:0, alpha:1)
        UITabBar.appearance().tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        
        return true
    }

}


