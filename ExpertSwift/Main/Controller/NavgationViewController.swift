//
//  NavgationViewController.swift
//  ExpertSwift
//
//  Created by jyyl on 2017/11/8.
//  Copyright © 2017年 jyyl. All rights reserved.
//

import UIKit

class NavgationViewController: UINavigationController, UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let navBar = UINavigationBar.appearance()
//        navBar.backgroundColor = UIColor.brown
//        navBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 17)]
        self.interactivePopGestureRecognizer?.delegate = self
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        let rootView = viewController.view
//        if #available(iOS 11.0, *) {
//            rootView?.frame = CGRect(x: (rootView?.safeAreaInsets.left)!, y: (rootView?.safeAreaInsets.top)!, width: SCREEN_WIDTH-(rootView?.safeAreaInsets.left)!-(rootView?.safeAreaInsets.right)!, height: SCREEN_HEIGHT-(rootView?.safeAreaInsets.bottom)!)
//        } else {
//            // Fallback on earlier versions
//        }
        

//        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem., target: <#T##Any?#>, action: <#T##Selector?#>)

        if self.childViewControllers.count > 0  {
//            let btn = UIButton(type: .custom)
////            btn.setTitle("返回", for: .normal)
//            btn.setTitleColor(UIColor.black, for: .highlighted)
//            btn.sizeToFit()
//            btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
            //            btn.addTarget(self, action: Selector(("back")), for: .touchUpInside)
//            let  leftBarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
//            leftBarButton.setTitle("back", for: UIControlState.normal)
//
//            let leftItem = UIBarButtonItem(customView: leftBarButton)
//            self.navigationItem.leftBarButtonItem = leftItem
            test()
            //隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true

        }
        super.pushViewController(viewController, animated: true)


    }
    func back(){
        self.popViewController(animated: true)
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.childViewControllers.count > 1;
    }
    func test() {
        //隐藏系统的导航栏 不然点击事件受到影响
        self.navigationController?.isNavigationBarHidden=true
        // 创建一个导航栏
        let navBar = UINavigationBar(frame: CGRect(x:0, y:20, width:self.view.frame.size.width, height:60))
        // 导航栏背景颜色
        navBar.backgroundColor = UIColor.blue
        //这里是导航栏透明
        //navBar.shadowImage = UIImage()
        //navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        // 自定义导航栏的title，用UILabel实现
        let titleLabel = UILabel(frame: CGRect(x:0,y:0,width:50,height:60))
        titleLabel.text = "LOG IN"
        titleLabel.textColor = UIColor.red
        //这里使用系统自定义的字体
        //titleLabel.font = UIFont(name: "Roboto-Medium", size: 16)
        
        // 创建导航栏组件
        let navItem = UINavigationItem()
        // 设置自定义的title
        navItem.titleView = titleLabel
        
        // 创建左侧按钮
        let leftButton = UIBarButtonItem(title: "leftButton", style: .plain, target: self, action: nil)
        leftButton.tintColor = UIColor.red
        
        // 创建右侧按钮
        let rightButton = UIBarButtonItem(title: "rightButton", style: .plain, target: self, action: nil)
        rightButton.tintColor = UIColor.red
        
        // 添加左侧、右侧按钮
        navItem.setLeftBarButton(leftButton, animated: false)
        navItem.setRightBarButton(rightButton, animated: false)
        
        navigationItem.setHidesBackButton(true, animated: false)
        // 把导航栏组件加入导航栏
        navBar.pushItem(navItem, animated: false)
        
        // 导航栏添加到view上
        self.view.addSubview(navBar)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



