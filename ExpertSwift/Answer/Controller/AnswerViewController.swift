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
        let v = CountDownView()
        
        v.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        
        self.view.addSubview(v)
        
    }
    func setUpWKwebView() {
        
        let webConfiguration = WKWebViewConfiguration()
        let myURL = URL(string: "http://by.zgshfp.com.cn/app/Billboard.html")
        webView = WKWebView(frame: view.bounds, configuration: webConfiguration)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        view.addSubview(webView)
        
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
