import UIKit
import Flutter
import AppTrackingTransparency

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
       
        // [START register_for_notifications]
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: { _, _ in }
            )
        } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        // [END register_for_notifications]
        
        //OneSignal Notification Badges Verify
        if let userDefaults = UserDefaults(suiteName: "group.com.wrteam.webviewprime.onesignal") {
            userDefaults.set("test 1" as AnyObject, forKey: "key1")
            userDefaults.set("test 2" as AnyObject, forKey: "key2")
            userDefaults.synchronize()
        }
        if let userDefaults = UserDefaults(suiteName: "group.com.wrteam.webviewprime.onesignal") {
            let value1 = userDefaults.string(forKey: "key1")
            let value2 = userDefaults.string(forKey: "key2")
            print("value1 = ", value1?.description ?? "No value")
            print("value2 = ", value2?.description ?? "No value")
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
      override func applicationDidBecomeActive(_ application: UIApplication) {
        if #available(iOS 15.0, *) {
           ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
           })
        }
    }
}
