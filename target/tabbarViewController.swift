//
//  tablebarViewController.swift
//  target
//
//  Created by zhangjidong on 16/3/20.
//  Copyright © 2016年 zhangjidong. All rights reserved.
//

import UIKit

class tabbarViewController: UIViewController {
    
    var window: UIWindow?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.window = UIWindow(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
        
        let tabbarController = UITabBarController()
        let indexController = UINavigationController(rootViewController: indexViewController())
        let chatController = UINavigationController(rootViewController: chatViewController())
        let myController = UINavigationController(rootViewController: myViewController())
        
        tabbarController.viewControllers = [indexController,chatController,myController]
        
        let tabitem1 = UITabBarItem(title: "首页", image: UIImage(named:"tabbar_home"), selectedImage: UIImage(named: "tabbar_home_selected"))
        let tabitem2 = UITabBarItem(title: "消息", image: UIImage(named: "tabbar_chat"), selectedImage: UIImage(named: "tabbar_chat_selected"))
        let tabitem3 = UITabBarItem(title: "我的", image: UIImage(named: "tabbar_me"), selectedImage: UIImage(named: "tabbar_me_selected"))
        
        indexController.tabBarItem = tabitem1
        chatController.tabBarItem = tabitem2
        myController.tabBarItem = tabitem3
        
        myController.tabBarController?.tabBar.tintColor = MAIN_RED
        
        self.window?.rootViewController = tabbarController
        self.window?.makeKeyAndVisible()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
