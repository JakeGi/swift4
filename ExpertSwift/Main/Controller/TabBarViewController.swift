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
        addChildViewController(childController: HomeViewController(), title: "首页", imageName: "", selectedImage: "")
        addChildViewController(childController: AnswerViewController(), title: "问答", imageName: "", selectedImage: "")
        addChildViewController(childController: MyCenterViewController(), title: "我的", imageName: "", selectedImage: "")
        
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
