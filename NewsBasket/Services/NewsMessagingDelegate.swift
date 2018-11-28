//
//  NewsFirebaseMessagingDelegate.swift
//  NewsBasket
//
//  Created by jieyi on 2018-11-20.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

import FirebaseCore
import FirebaseMessaging
import UserNotifications
import Utility

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        // The token comes from firebase service.
        logw("Firebase registration token: \(fcmToken)")
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        if let title = userInfo["news_title"] as? String,
           let content = userInfo["news_body"] as? String,
           let author = userInfo["news_author"] as? String,
           let imageUrl = userInfo["image_url"] as? String,
           let newsUrl = userInfo["news_url"] as? String {
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let notificationContent = UNMutableNotificationContent()
            notificationContent.title = "Your subscribing news"
            notificationContent.subtitle = author
            notificationContent.body = title
            notificationContent.userInfo = ["news_url": newsUrl]
            let request = UNNotificationRequest(identifier: title, content: notificationContent, trigger: trigger)

            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
}

@available(iOS 10, *)
extension AppDelegate: UNUserNotificationCenterDelegate {
    /// When App in foreground, triggering receiving the message which is from firebase server.
    ///
    /// - Parameters:
    ///   - center:
    ///   - notification:
    ///   - completionHandler:
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // 印出後台送出的推播訊息(JOSN 格式)
        let userInfo = notification.request.content.userInfo
        logd("userInfo: \(userInfo)")

        if let messageID = userInfo[gcmMessageIDKey] {
            logw("Message ID: \(messageID)")
        }

        // 可設定要收到什麼樣式的推播訊息，至少要打開 alert，不然會收不到推播訊息
        completionHandler([.badge, .sound, .alert])
    }

    /// When App in background or down, triggering receiving the message which is from firebase server.
    ///
    /// - Parameters:
    ///   - center:
    ///   - response:
    ///   - completionHandler:
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        // 印出後台送出的推播訊息(JOSN 格式)
        let userInfo = response.notification.request.content.userInfo
        logd("userInfo: \(userInfo)")

        completionHandler()

        // 取出userInfo的link並開啟Facebook
        let requestUrl = URL(string: userInfo["news_url"]! as! String)
        UIApplication.shared.open(requestUrl!, options: [:], completionHandler: nil)
    }
}
