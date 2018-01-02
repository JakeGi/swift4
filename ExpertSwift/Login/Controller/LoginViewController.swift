//
//  LoginViewController.swift
//  ExpertSwift
//
//  Created by jyyl on 2017/11/8.
//  Copyright © 2017年 jyyl. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON
import NVActivityIndicatorView
import HandyJSON

class LoginViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var phoneLab :UITextField!
    var paswordLab  :UITextField!
    var loginBtn :UIButton!
    var icoImg :UIImageView!
    var phoneView:UIView!
    var passwordView:UIView!
    var image  = UIImage()

    var activityIndicatorView:NVActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        creatUI()
        
        
        let x = (SCREEN_WIDTH-50)/2
        let y = (SCREEN_HEIGHT-50)/2
        self.activityIndicatorView = NVActivityIndicatorView(frame: .init(x: x, y:y , width: 50, height: 50 ), type: .ballZigZagDeflect, color: UIColor.red, padding: 10)
        self.view .addSubview(activityIndicatorView)
        
        let s = getNetworkStates()!
       print( s)
        
    }

    fileprivate func creatUI(){
        phoneLab = UITextField()
        phoneLab.placeholder = "请输入手机号"
        
        let phoneImg = UIImageView()
        phoneImg.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        phoneImg.image = UIImage(named:"Login.bundle/ico_mobile")
        phoneLab.leftView = phoneImg
        phoneLab.leftViewMode = UITextFieldViewMode.always
        
        paswordLab = UITextField()
        paswordLab.textAlignment = NSTextAlignment.left
        paswordLab.placeholder = "请输入密码"
         let passwordImg = UIImageView()
        passwordImg.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        passwordImg.image = UIImage(named:"Login.bundle/ico_mobile")
        paswordLab.leftView = passwordImg
        paswordLab.leftViewMode = UITextFieldViewMode.always
        
        loginBtn = UIButton()
        loginBtn.setTitle("登录", for: UIControlState.normal)
        loginBtn.setBackgroundImage(UIImage(named:"Login.bundle/btn_primary_default"), for: UIControlState.normal)
        loginBtn.addTarget(self, action: #selector(login), for: UIControlEvents.touchUpInside)
        
        icoImg = UIImageView()
        icoImg.image = UIImage(named:"Login.bundle/ico_logo")
        
        phoneView = UIView()
        phoneView.backgroundColor = UIColorFromRGB(0x90979C)
        
        passwordView = UIView()
        passwordView.backgroundColor = UIColorFromRGB(0x90979C)
        
        view.addSubview(icoImg)
        view.addSubview(phoneLab)
        view.addSubview(phoneImg)
        view.addSubview(paswordLab)

        view.addSubview(phoneView)
        view.addSubview(passwordImg)
        view.addSubview(passwordView)
        view.addSubview(loginBtn)

        icoImg.snp.makeConstraints { (make) in
            make.top.equalTo(70)
            make.centerX.equalToSuperview()

        }
        
        phoneLab.snp.makeConstraints { (make) in
            make.top.equalTo(icoImg.snp.bottom).offset(50)
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        phoneView.snp.makeConstraints { (make) in
            make.bottom.equalTo(phoneLab.snp.bottom)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
            make.left.equalToSuperview().offset(20)

        }
        
        paswordLab.snp.makeConstraints { (make) in
            make.top.equalTo(phoneLab.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        passwordView.snp.makeConstraints { (make) in
            make.bottom.equalTo(paswordLab.snp.bottom)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
            make.left.equalToSuperview().offset(20)
            
        }
        
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(paswordLab).offset(100)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        

    }
//    Login.bundle/ico_seenothing
    //登录按钮
    @objc func login(){
        let tabbar = TabBarViewController()
        let window :UIWindow = UIApplication.shared.keyWindow!
        window.rootViewController = tabbar;
        window.makeKeyAndVisible()
//        UIAlertController.showAlert(message: "2323", in: self)
//        UIAlertController.showApliactionAlert(message: "123")
//        UIAlertController.showConfirm(message: "sss", in: self) { action in
//            print("weee")
//        }
//        UIAlertController.showTipAlert(message: "ddd#pragma mark - <#type#>", in: self)
//        UIAlertController.showActionSheet(title: "122", message: "22222222", firstName: "1", secondName: "2", in: self, first: { action in
//            print("1")
//        }) { (action) in
//            print("2")
//        }

        
//        print(NetWorkTools.getNetworkStates())
//        UIAlertController.alertChooseImgActionSheet(title: "选择图片", in: self, deleget: self)
//        self.activityIndicatorView.startAnimating()
        let param = ["police_code": "t1001","password":"123456","alias":"82A7E709EFC04BA5AE0E73DF0B243560","login_type":"police_code","platform":"2"];

        let url  = "web/interfaces/userinfo/login.action";

        NetWorkTools.requestJSON(type: .post, urlString: url, parameters: param, succeed: { (result, error) in
            print("result\(result!)")
           self.activityIndicatorView.stopAnimating()
            let json = JSON(result).dictionaryObject
            let user:NSMutableDictionary = NSMutableDictionary()
            
            for (key,subJson) in json! {
                
                user.setValue(subJson, forKey: key)
            }
            SaveTools.mg_Archiver(user, path: "userInfo")

            let tabbar = TabBarViewController()
            let window :UIWindow = UIApplication.shared.keyWindow!
            window.rootViewController = tabbar;
            window.makeKeyAndVisible()

        }) { (error) in


        }

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("info\(info)")
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        picker.dismiss(animated: true) {
            print("退出")
            
            
        }
        
    }
}
