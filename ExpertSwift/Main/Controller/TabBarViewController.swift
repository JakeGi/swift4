//
//  TabBarViewController.swift
//  ExpertSwift
//
//  Created by jyyl on 2017/11/8.
//  Copyright © 2017年 jyyl. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor(red: 245 / 255, green: 90 / 255, blue: 93 / 255, alpha: 1/0)
        
        addChildViewControllers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //添加自控制器
    private func addChildViewControllers() {
        addChildViewController(childController: HomeViewController(), title: "首页", imageName: "tabbar_icon_home_normal", selectedImage: "tabbar_icon_home_pressed")
        addChildViewController(childController: AnswerViewController(), title: "我听", imageName: "tabbar_icon_hear_normal", selectedImage: "tabbar_icon_hear_pressed")
        addChildViewController(childController: FoundViewController(), title: "发现", imageName: "tabbar_icon_Rss_normal", selectedImage: "tabbar_icon_Rss_pressed")
        addChildViewController(childController: MyCenterViewController(), title: "我的", imageName: "tabbar_icon_mine_normal", selectedImage: "tabbar_icon_mine_pressed")

        
    }
    
    private func addChildViewController(childController: UIViewController,title:String,imageName:String,selectedImage:String) {
        childController.tabBarItem.image = UIImage(named:imageName);
        childController.tabBarItem.selectedImage = UIImage(named:selectedImage)
        childController.title = title
        
        let nav = NavgationViewController(rootViewController:childController)
        nav.navigationController?.title = title
        addChildViewController(nav)
        
    }

}
