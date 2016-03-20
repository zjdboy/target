//
//  indexViewController.swift
//  target
//
//  Created by zhangjidong on 16/3/15.
//  Copyright © 2016年 zhangjidong. All rights reserved.
//

import UIKit

class indexViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //延迟3秒
        NSThread.sleepForTimeInterval(3.0)
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "首页"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
