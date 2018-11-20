//
//  NewsFirebaseMessagingDelegate.swift
//  NewsBasket
//
//  Created by jieyi on 2018-11-20.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

import UserNotifications
import FirebaseCore
import FirebaseMessaging
import Utility

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        // The token comes from firebase service.
        logw("Firebase registration token: \(fcmToken)")
    }
}

@available(iOS 10, *)
extension AppDelegate: UNUserNotificationCenterDelegate {
    /*
    When App in foreground, triggering receiving the message which is from firebase server.
    */
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // 印出後台送出的推播訊息(JOSN 格式)
        let userInfo = notification.request.content.userInfo
        logd("userInfo: \(userInfo)")

        // 可設定要收到什麼樣式的推播訊息，至少要打開 alert，不然會收不到推播訊息
        completionHandler([.badge, .sound, .alert])
    }

    /*
    When App in background or down, triggering receiving the message which is from firebase server.
    */
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        // 印出後台送出的推播訊息(JOSN 格式)
        let userInfo = response.notification.request.content.userInfo
        logd("userInfo: \(userInfo)")

        completionHandler()
    }
}
