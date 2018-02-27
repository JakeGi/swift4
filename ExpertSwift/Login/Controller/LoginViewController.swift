//
//  LoginViewController.swift
//  ExpertSwift
//
//  Created by jyyl on 2017/11/8.
//  Copyright © 2017年 jyyl. All rights reserved.
//

import UIKit
import SnapKit
class LoginViewController: UIViewController {

    let loginBtn = UIButton()
    let phoneText = UITextField()
    let password = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.title = "登录"
//        self.view.backgroundColor = UIColor.white
        creatUI()
        


    }

    fileprivate func creatUI(){
        
        let imageView = UIImageView(image:UIImage(named:"bg_login"))
        self.view.addSubview(imageView)
        
        
        let topImg = UIImageView(image:UIImage(named:"logosign"))
        self.view.addSubview(topImg)
        
  
        phoneText.placeholder = "请输入手机号"
        phoneText.addPaddingLeftIcon(UIImage(named:"phone")!, padding: 10)
        phoneText.backgroundColor = UIColor.white
        phoneText.text = "15888888888"
        self.view.addSubview(phoneText)
        

        password.placeholder = "请输入密码"
        password.addPaddingLeftIcon(UIImage(named:"password")!, padding: 10)
        password.backgroundColor = UIColor.white
        password.text = "123456"
        self.view.addSubview(password)
        
      
        loginBtn.setTitle("登录", for: UIControlState.normal)
        loginBtn.setBackgroundImage(UIImage.WithColor(color: JHColorFromRGB(rgb: 0xFBBB56)), for: UIControlState.normal)
        loginBtn.addTarget(self, action: #selector(login), for: UIControlEvents.touchUpInside)
        self.view.addSubview(loginBtn);
        
        imageView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        topImg.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
        }
        
        phoneText.snp.makeConstraints { (make) in
            make.top.equalTo(topImg.snp.bottom).offset(50)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        password.snp.makeConstraints { (make) in
            make.top.equalTo(phoneText.snp.bottom).offset(10)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        loginBtn.snp.makeConstraints { (make) in
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
            make.top.equalTo(password.snp.bottom).offset(50)

        }
    }
    
    @objc func login(){
    
        let param = ["phone":phoneText.text!,"password":password.text!,"login_type":"phone","platform":"0","alias":"31323121231"] as [String : Any]
        
        JHNetManagerAPI.shareManager.JHRequestData(.post, URLString: loginURl, para: param as? [String : String] , ShowHUD: true) { (result) in
            print(result as! NSDictionary );
            let dic = result as! NSDictionary
//            UIAlertController.showAlert(message:dic["message"] as! String, in: self)
//            print(dic["code"]!)
            let code = dic["code"] as! String
            if (code == "001000") {
                let response  = dic["response"] as! NSDictionary
                SaveTools.mg_Archiver(response, path: "userInfo")
                let tabbar = TabBarViewController()
                UIApplication.shared.keyWindow?.rootViewController = tabbar
                UIApplication.shared.keyWindow?.makeKeyAndVisible()
            }
            
        }
    }

}
