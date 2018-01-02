//
//  PageMenu.swift
//  ExpertSwift
//
//  Created by jyyl on 2017/11/14.
//  Copyright © 2017年 jyyl. All rights reserved.
//

import UIKit



private let kSrolllineH : CGFloat = 2
private let kNormalColor : (CGFloat,CGFloat,CGFloat) = (85,85,85);
private let kSelectColor : (CGFloat,CGFloat,CGFloat) = (255,128,0);


class PageMenu: UIView {

    fileprivate var titles : [String]
    fileprivate var titleLabels : [UILabel] = [UILabel]()
    
    var dic1:Dictionary<String,String> = [:]
    var dic2 = Dictionary<String,Double>()
    var dic3 :[String:Double] = [:]
    var dic4 = [String:Double]()
    
    
        
    lazy var scrollView : UIScrollView = {
        
        let sco = UIScrollView()
        sco.showsHorizontalScrollIndicator = false
        sco.bounces = false
        sco.scrollsToTop = false
        sco.backgroundColor = UIColor.red
        return sco
        
    }()
    
    
    //重载构造函数, 不对外提供默认的构造函数
    init(frame: CGRect, titles: [String]) {
        
        self.titles = titles;
        super.init(frame: frame)
       scrollView.contentSize =  CGSize(width: frame.width*2, height: frame.height)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpUI () {
        
        scrollView.frame = bounds;
        addSubview(scrollView)
        
        setUpTitleLabels()
        
    }
    
    fileprivate func setUpTitleLabels (){
        
        let labelW : CGFloat = frame.width / (CGFloat)(titles.count)
        let labelH : CGFloat = frame.height - kSrolllineH
        let labelY : CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            let label = UILabel()
            
            label.frame = CGRect(x: (CGFloat)(index) * labelW, y: labelY, width: labelW, height: labelH)

            label.text = title;
            label.textAlignment = .center
            label.tag = index
            label.textColor = UIColor.yellow
            label.font = UIFont.systemFont(ofSize: 16)
            scrollView.addSubview(label)
//            titleLabels.append(label)
            
            if index == 0 {
                label.textColor = UIColor.white
            }
            
            //添加 label 的点击事件
            label.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(labelClick(gesture:)))
            label.addGestureRecognizer(tap)
            
        }
    }

}
extension PageMenu {
    
    @objc fileprivate func labelClick (gesture: UITapGestureRecognizer ){
        
        var ss = ["1":"2","1":"3"]
        print(ss.count)
        
//        let currentlabel = gesture.view as! UILabel
//        let beforelabel = titleLabels[currentIndex]
//
//        if currentIndex == currentlabel.tag {
//            return
//        }
//
//        scrollViewline.center.x = currentlabel.center.x
//
//        beforelabel.textColor = UIColor.blue
//        currentlabel.textColor = UIColor.purple
//
//        currentIndex = currentlabel.tag
//
//        delegate?.pageTitleView(pageTitleView: self, tapIndex: currentIndex)
    }
    
    
}
