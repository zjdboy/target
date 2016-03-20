//
//  AppDelegate.swift
//  target
//
//  Created by zhangjidong on 16/3/15.
//  Copyright © 2016年 zhangjidong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
        
        //判断App是否第一次启动
        if(!NSUserDefaults.standardUserDefaults().boolForKey("firstLaunch"))
        {
            self.window?.rootViewController = GuideViewController()
            self.window?.makeKeyAndVisible()
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstLaunch")
        }
        else
        {
            
            let tabbatController = UITabBarController()
            
            let indexController = UINavigationController(rootViewController: indexViewController())
            let chatController = UINavigationController(rootViewController: chatViewController())
            let myController = UINavigationController(rootViewController: myViewController())
            
            tabbatController.viewControllers = [indexController,chatController,myController]
            
            let tabitem1 = UITabBarItem(title: "首页", image: UIImage(named:"tabbar_home"), selectedImage: UIImage(named: "tabbar_home_selected"))
            let tabitem2 = UITabBarItem(title: "消息", image: UIImage(named: "tabbar_chat"), selectedImage: UIImage(named: "tabbar_chat_selected"))
            let tabitem3 = UITabBarItem(title: "我的", image: UIImage(named: "tabbar_me"), selectedImage: UIImage(named: "tabbar_me_selected"))
            
            indexController.tabBarItem = tabitem1
            chatController.tabBarItem = tabitem2
            myController.tabBarItem = tabitem3
            
            
            indexController.tabBarController?.tabBar.tintColor = MAIN_RED
            
            self.window?.rootViewController = tabbatController
            self.window?.makeKeyAndVisible()
            
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstLaunch")
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

