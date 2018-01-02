//
//  UIAlertExtension.swift
//  ExpertSwift
//
//  Created by jyyl on 2017/12/8.
//  Copyright © 2017年 jyyl. All rights reserved.
//

import UIKit


extension UIAlertController{
    
    /**
     *  @param 在指定视图控制器上弹出普通消息提示框
     */
    
    static func showAlert(message:String,in viewController:UIViewController){
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: { action in
            
        }))
        
        viewController.present(alert, animated: true, completion: nil)
        
    }
    
    
    /**
     *  @param 在指定视图控制器上弹出确认框
     */
    
    static func showConfirm(title:String,message:String, in viewController:UIViewController,confirm:((UIAlertAction) -> Void)?){
       
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: confirm))
        viewController.present(alert, animated: true)
    }
    
    /**
     *  @param 在指定视图控制器上弹出单行文字提示框
     */
    
    static func showTipAlert(title:String,message:String,in viewController:UIViewController){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        viewController.present(alert, animated: true, completion: nil)
        //两秒钟后自动消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            viewController.presentedViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    
    /**
     *  @param 在指定视图控制器上弹出actionSheet(两行)
     */
    
    static func showActionSheet(title:String,message:String,firstName:String,secondName:String, in viewController:UIViewController,first:((UIAlertAction) -> Void)?,second:((UIAlertAction) -> Void)?){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
      
        let canAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let firstName  = UIAlertAction(title: firstName, style: .default, handler: first)
        let secondName  = UIAlertAction(title: secondName, style: .default, handler: second)

        alert.addAction(canAction)
        alert.addAction(firstName)
        alert.addAction(secondName)

        viewController.present(alert, animated: true, completion: nil)
    }
    
    
    /**
     *  @param 在指定视图控制器上弹出选择相册
     */
    
    static func alertChooseImgActionSheet(title:String, in viewController:UIViewController,deleget:Any){
        
        let alertSheet = UIAlertController(title: title, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        // 2 命令（样式：退出Cancel，警告Destructive-按钮标题为红色，默认Default）
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
        let PhotoAction = UIAlertAction(title: "相册", style: UIAlertActionStyle.default, handler: {
            action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                //初始化图片控制器
                let pick = UIImagePickerController()
                //代理
                pick.delegate = deleget as? UIImagePickerControllerDelegate & UINavigationControllerDelegate;
                //指定图片控制器类型
                pick.sourceType = UIImagePickerControllerSourceType.photoLibrary
                //设置是否允许编辑
                //            pick.allowsEditing = editSwitch.on
                //弹出图片控制器
                viewController.present(pick, animated: true, completion: {
                    
                })
            }else{
                print("读取相册错误")
            }
            
        })
        let cameraAction = UIAlertAction(title: "相机", style: UIAlertActionStyle.default, handler: {
            action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            //创建图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = deleget as? UIImagePickerControllerDelegate & UINavigationControllerDelegate;
            //设置来源
            picker.sourceType = UIImagePickerControllerSourceType.camera
            //允许编辑
            picker.allowsEditing = true
            //打开相机
            viewController.present(picker, animated:true, completion: nil)
        }else{
                print("找不到相机")
        }
        })
  
        alertSheet.addAction(PhotoAction)
        alertSheet.addAction(cameraAction)
        alertSheet.addAction(cancelAction)
        // 3 跳转
        viewController.present(alertSheet, animated: true, completion: nil)
    }
    
    
}
