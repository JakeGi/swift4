//
//  reachability.swift
//  ExpertSwift
//
//  Created by jyyl on 2017/12/11.
//  Copyright © 2017年 jyyl. All rights reserved.
//

import UIKit
import ReachabilitySwift


let reachability = Reachability()!

enum NetworkStatus {
    case NetworkStatusNone  // 没有网络
    case NetworkStatusWAN    // 2G/3G/4G
    case NetworkStatusWIFI   // WIFI
}

/**
 *  @param 获取网络状态
 */
 func getNetworkStates() -> NetworkStatus? {
    
    do{
        try reachability.startNotifier()
        
        //判断连接状态
        if reachability.isReachable {
            
            //判断连接类型
            if reachability.isReachableViaWiFi {
                
                return  NetworkStatus.NetworkStatusWIFI
                
            }else if reachability.isReachableViaWWAN{
                
                return  NetworkStatus.NetworkStatusWAN
                
            }else {
                
                return  NetworkStatus.NetworkStatusNone
            }
        }else{
            
            //没有网络连接
            return  NetworkStatus.NetworkStatusNone
        }
        
    }catch{
        print("------")
    }
    return  NetworkStatus.NetworkStatusNone
}

/**
 *  @param 停止监听网络
 */
func stopGetNetworkState(){
    reachability.stopNotifier()
}


