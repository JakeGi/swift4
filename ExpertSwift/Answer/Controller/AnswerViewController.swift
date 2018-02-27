//
//  AnswerViewController.swift
//  ExpertSwift
//
//  Created by jyyl on 2017/11/8.
//  Copyright © 2017年 jyyl. All rights reserved.
//

import UIKit
import WebKit
class AnswerViewController: UIViewController,WKNavigationDelegate,WKUIDelegate {

    var webView = WKWebView()
    override func viewDidLoad() {
        super.viewDidLoad()

//        setUpWKwebView()
//        let v = CountDownView()
//
//        v.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
//
//        self.view.addSubview(v)
//        webView.frame = CGRect(x:0, y:0,width:SCREEN_WIDTH, height:SCREEN_HEIGHT-NAV_HEIGHT-20)

    
        
//        let request = NSURLRequest.init(URL: NSURL.init(string: "http://by.zgshfp.com.cn/app/Billboard.html?token=6e61b4ebc27df7ae861b4ba7c06899ef2a00196ae75648dd06c3f92ecafa7010ded9da1a2440e1b7b01e06210d0d2f539836a944f5490ae7f0cb90efb234573ae0053a1df52c407061”)
//        webView.loadRequest(request)
//            self.view.addSubview(webView) as URL
        
    }
    func setUpWKwebView() {
        
        let webConfiguration = WKWebViewConfiguration()
        let myURL = URL(string: "http://by.zgshfp.com.cn/app/Billboard.html?token=6e61b4ebc27df7ae861b4ba7c06899ef2a00196ae75648dd06c3f92ecafa7010ded9da1a2440e1b7b01e06210d0d2f539836a944f5490ae7f0cb90efb234573ae0053a1df52c407061")
        webView = WKWebView(frame:CGRect(x:0, y:0,width:SCREEN_WIDTH, height:SCREEN_HEIGHT-NAV_HEIGHT-20), configuration: webConfiguration)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        self.view.addSubview(webView)
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
