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
//        navigationBar.setBackgroundImage(UIImage(named:"bg_navigationbar"), for: .default)

//
//        let navBar = UINavigationBar.appearance()
//        navBar.setBackgroundImage(UIImage(named:"bg_navigationbar"), for: .default)
//        if #available(iOS 11.0, *) {
//            navBar.prefersLargeTitles = true
//        } else {
//            // Fallback on earlier versions
//        }

//        navBar.backgroundImage(for: UIBarMetrics.default)
//        navigationBar.isTranslucent = false
//        navBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 17)]
        self.interactivePopGestureRecognizer?.delegate = self
//        if #available(iOS 11.0, *) {
//            navigationItem.largeTitleDisplayMode = .never
//        } else {
            // Fallback on earlier versions
//        };
//        navBar.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
//        navBar.navigationItem.largeTitleDisplayMode = ;

//        NSDictionary *attrDict1 = @{ NSForegroundColorAttributeName: [UIColor whiteColor] };
//        [self.navigationController.navigationBar setLargeTitleTextAttributes:attrDict1];
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        let rootView = viewController.view
//        if #available(iOS 11.0, *) {
//            rootView?.frame = CGRect(x: (rootView?.safeAreaInsets.left)!, y: (rootView?.safeAreaInsets.top)!, width: SCREEN_WIDTH-(rootView?.safeAreaInsets.left)!-(rootView?.safeAreaInsets.right)!, height: SCREEN_HEIGHT-(rootView?.safeAreaInsets.bottom)!)
//        } else {
//            // Fallback on earlier versions
//        }
        

//        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem., target: <#T##Any?#>, action: <#T##Selector?#>)

//        if self.childViewControllers.count > 0  {
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
            //隐藏tabbar
//            viewController.hidesBottomBarWhenPushed = true
//
//        }
//        super.pushViewController(viewController, animated: true)
        if childViewControllers.count > 0 {
            let btn = UIButton(type: .custom)
    //            btn.setTitle("返回", for: .normal)
            btn.setTitleColor(UIColor.black, for: .highlighted)
            btn.sizeToFit()
            btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
            btn.addTarget(self, action: Selector(("back")), for: .touchUpInside)
            let  leftBarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
            leftBarButton.setTitle("back", for: UIControlState.normal)

            let leftItem = UIBarButtonItem(customView: leftBarButton)
            self.navigationItem.leftBarButtonItem = leftItem
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)


    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    /**
     *  @param 点击返回按钮
     */
    func back(){
        self.popViewController(animated: true)
    }
    // MARK: - 点击事件

    /**
     *  @param 如果栈viewController数大于1，触发手势
     */
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.childViewControllers.count > 1;
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


