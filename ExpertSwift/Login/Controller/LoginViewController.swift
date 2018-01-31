//
//  LoginViewController.swift
//  ExpertSwift
//
//  Created by jyyl on 2017/11/8.
//  Copyright © 2017年 jyyl. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "登录"
        self.view.backgroundColor = UIColor.white
        creatUI()
        


    }

    fileprivate func creatUI(){
        
        let topView:UIView = UIView()
        topView.backgroundColor = UIColor.purple
        self.view.addSubview(topView)
        
        let leftBtn:UIButton = UIButton()
        leftBtn.setTitle("账号密码登录", for: UIControlState.normal)
        topView.addSubview(leftBtn)
        
        let rightBtn:UIButton = UIButton()
        rightBtn.setTitle("快捷免密登录", for: UIControlState.normal)
        topView.addSubview(rightBtn)
        
        topView.snp.makeConstraints { (make) in
            make.width.equalTo(SCREEN_WIDTH)
            make.height.equalTo(50)
            make.top.equalTo(NAV_HEIGHT)
        }
        leftBtn.snp.makeConstraints { (make) in
            make.width.equalTo(SCREEN_WIDTH/2)
            make.height.equalTo(50)
            make.top.equalTo(topView.snp.top)
        }
        rightBtn.snp.makeConstraints { (make) in
            make.width.equalTo(SCREEN_WIDTH/2)
            make.height.equalTo(50)
            make.left.equalTo(leftBtn.snp.right)
            make.top.equalTo(topView.snp.top)
        }

    }

}
