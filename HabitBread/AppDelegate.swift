//
//  AppDelegate.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/27.
//

import UIKit
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate{
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Initialize Sign In with Firebase
        
        GIDSignIn.sharedInstance().clientID = "191839451290-4kkn9ttisgklp7fc5713pbqesi6u4ghe.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        if (GIDSignIn.sharedInstance()?.hasPreviousSignIn() != nil) {
            GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        }
        return true
    }

    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}

extension AppDelegate: GIDSignInDelegate{
    // MARK: GOOGLE LOGIN
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(error.localizedDescription)
            return
        }
        NotificationCenter.default.post(name: .signInGoogleCompleted, object: nil)
    }
}

extension Notification.Name {
    static var signInGoogleCompleted: Notification.Name {
        return .init(rawValue: #function)
    }
}

