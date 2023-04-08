//
//  AppDelegate.swift
//  iphone-settings-screen-App
//
//  Created by Georgiy on 28.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController.init(rootViewController: SettingsController())
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
        return true
    }
}
