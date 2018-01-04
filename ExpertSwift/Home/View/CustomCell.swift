//
//  CustomCell.swift
//  ExpertSwift
//
//  Created by jyyl on 2018/1/4.
//  Copyright © 2018年 jyyl. All rights reserved.
//

import UIKit
import SnapKit
class CustomCell: UITableViewCell {
    var titleLab = UILabel()
    var picImgView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.titleLab.textColor = UIColor.blue
        self.addSubview(self.titleLab)
    }
    override func layoutSubviews() {
        
        self.titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
