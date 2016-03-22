//
//  GuideViewController.swift
//  target
//
//  Created by zhangjidong on 16/3/15.
//  Copyright © 2016年 zhangjidong. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController,UIScrollViewDelegate {
    
    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    var btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //配置pageControl
        pageControl.center = CGPointMake(self.view.frame.width/2, self.view.frame.height-30)
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.numberOfPages = 4
        pageControl.addTarget(self, action: #selector(UIScrollViewDelegate.scrollViewDidEndDecelerating(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        //配置scrollView
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSizeMake(4*self.view.frame.width, 0)
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for i in 0 ..< 4
        {
            let image = UIImage(named: "Guide_\(i+1)")
            let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            imageView.image = image
            var frame = imageView.frame
            frame.origin.x = CGFloat(i)*frame.size.width
            imageView.frame = frame
            scrollView.addSubview(imageView)
            self.view.addSubview(pageControl)
        }
    }

    /**
     按钮点击事件
     
     - parameter button: UIButton
     */
    func buttonClick(button:UIButton)
    {
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
        
        
        //跳转页面
        self.presentViewController(tabbarController, animated: true, completion: nil)
    }
    
    /**
     导航处理
     
     - parameter scrollView: UIScrollView
     */
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / self.view.frame.size.width)    //获取当前页数
        pageControl.currentPage = index
        //在这里添加按钮的渐入效果,当页面滑到第4页时出现
        if(index == 3)
        {
            self.btn.frame = CGRectMake(3*self.view.frame.width, self.view.frame.height, self.view.frame.width, 50)
            self.btn.setTitle("开启旅程", forState: UIControlState.Normal)
            self.btn.titleLabel?.font = UIFont.systemFontOfSize(20)
            self.btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
            self.btn.backgroundColor = UIColor.orangeColor()
            self.btn.alpha = 0
            self.btn.addTarget(self, action: #selector(GuideViewController.buttonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            UIView.animateWithDuration(1.5, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.btn.frame = CGRectMake(3*self.view.frame.width, self.view.frame.height-100, self.view.frame.width, 50)
                self.btn.alpha = 1
                //注意把按钮添加到scrollView上,不要添加到imageView上,会无法点击
                self.scrollView.addSubview(self.btn)
                }, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
