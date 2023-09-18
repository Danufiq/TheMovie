//
//  AppDelegate.swift
//  TheMovie
//
//  Created by dana nur fiqi on 16/09/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let mainNavigationController = UINavigationController(rootViewController: MainMovieViewController())
        mainNavigationController.setNavigationBarHidden(true, animated: false)
        window.rootViewController = mainNavigationController
        window.makeKeyAndVisible()
                
        self.window = window
        return true
    }

    


}

