//
//  NetWorkManger.swift
//  ExpertSwift
//
//  Created by jyyl on 2018/1/10.
//  Copyright © 2018年 jyyl. All rights reserved.
//

import UIKit
import Alamofire

enum MethType{
    case GET
    case POST
}
class NetWorkManger{
    
    func requestJSON(type:MethType,urlString:String,parameters:[String:Any]? = nil,success:((),()),error:((),())){
        
         let method = type == .GET ? MethType.GET : MethType.POST
        
//        Alamofire.request(MethType,url:urlString, parameters: parameters)
//            .responseJSON { response in
//
//                print("result==\(response.result)")   // 返回结果，是否成功
//                if let jsonValue = response.result.value {
//                    /*
//                     error_code = 0
//                     reason = ""
//                     result = 数组套字典的城市列表
//                     */
//                    print("code: \(jsonValue)")
//                }
//        }
    
        
    }
}
