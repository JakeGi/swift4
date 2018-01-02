//
//  Const.swift
//  swiftDemo
//
//  Created by jyyl on 2017/11/3.
//  Copyright © 2017年 jyyl. All rights reserved.
//

import UIKit


/*----------------------------------------------------------*/

#if DEBUG // 判断是否在测试环境下
    // TODO
   
    //加载图片拼接域名
    let JYPostUrl  = "http://112.74.175.100:8080/web"
    //分享图片url
    let shareImgUrl  = "https://112.74.175.100:8080"
    //H5页面拼接域名
    let HtmlUrl = "http://112.74.175.100:8080/web"
    //网络请求路径
    let AfnBaseUrl  = "http://112.74.175.100:8080/"
#else
    // TODO
    //加载图片拼接域名
    let JYPostUrl  = "http://112.74.175.100:8080/web"
    //分享图片url
    let shareImgUrl  = "https://112.74.175.100:8080"
    //H5页面拼接域名
    let HtmlUrl = "http://112.74.175.100:8080/web"
    //网络请求路径
    let AfnBaseUrl = "http://112.74.175.100:8080/"
#endif

