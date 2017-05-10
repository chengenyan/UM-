//
//  AppDelegate.swift
//  UMshare
//
//  Created by apple on 2017/4/13.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UMSocialManager.default().openLog(true)//打开日志
        UMSocialManager.default().umSocialAppkey="56a6e4c667e58eb4c4001c9e"
        configUSharePlatforms()
        // Override point for customization after application launch.
        return true
    }
    func configUSharePlatforms()  {
         /* 设置微信的appKey和appSecret */
        UMSocialManager.default().setPlaform(UMSocialPlatformType.wechatSession, appKey: "wxa37a9edfa2196bd0", appSecret: "", redirectURL: "http://mobile.umeng.com/social")
        //qq
         UMSocialManager.default().setPlaform(UMSocialPlatformType.QQ, appKey: "1105213118", appSecret: "FX5invSYPI7yiD0V", redirectURL: "http://mobile.umeng.com/social")
        
          UMSocialManager.default().setPlaform(UMSocialPlatformType.sina, appKey: "168665276", appSecret: "1478610d2b154cf7d6cd7450d1fb37e7", redirectURL: "http://sns.whalecloud.com/sina2/callback")
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let result=UMSocialManager.default().handleOpen(url, sourceApplication: sourceApplication, annotation: annotation)
        print("1")
        if !result {
            //其他SDK的调用
        }
        return result
    }
    //仅支持iOS9以上系统，iOS8及以下系统不会回调
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let result=UMSocialManager.default().handleOpen(url, options: options)
        print("2")
       return result
    }
    //2.支持目前所有iOS系统
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
         let result=UMSocialManager.default().handleOpen(url)
        print("3")
          return result
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

