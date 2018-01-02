//
//  CustomButton.swift
//  ExpertSwift
//
//  Created by jyyl on 2017/12/22.
//  Copyright © 2017年 jyyl. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        setTitleColor(UIColor.orange, for: UIControlState.normal)
        setImage(UIImage(named:""), for: UIControlState.normal)
        setImage(UIImage(named:""), for: UIControlState.selected)
        sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width
    }
    
}
