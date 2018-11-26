//
//  AppDelegate.swift
//  NewsBasket
//
//  Created by Jieyi Wu on 2018/11/19.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

import FirebaseCore
import FirebaseMessaging
import SwiftyBeaver
import UIKit
import UserNotifications
import Utility

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Init the log module.
        let console = ConsoleDestination()
        console.format = loggerFormat
        swiftyLogger.addDestination(console)

        return true
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
            Messaging.messaging().delegate = self // For iOS 10 data message (sent via FCM).

            // Open a alert dialog for getting the grant to receive three type of notification (alert), (sound),
            // (badge).
            UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { granted, error in
                    logw(granted ? "grated" : "no granted")
                })
        } else {
            let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()
        FirebaseApp.configure()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for
        // certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user
        // quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks.
        // Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough
        // application state information to restore your application to its current state in case it is terminated
        // later.
        // If your application supports background execution, this method is called instead of
        // applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of
        // the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive.
        // If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate.
        // See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Transfer Data to String.
        let deviceTokenString = deviceToken.reduce("", { $0 + String(format: "%02X", $1) })
        logw("deviceTokenString: \(deviceTokenString)")
    }
}
