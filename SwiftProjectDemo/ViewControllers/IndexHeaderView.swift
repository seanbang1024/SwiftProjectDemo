//
//  IndexHeaderView.swift
//  SwiftProjectDemo
//
//  Created by 郭榜 on 2017/8/24.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

import UIKit
import SnapKit

class IndexHeaderView: UIView {

    let v1 = UIView()
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        

        self.addSubview(v1)
        v1.backgroundColor = UIColor.hexStringToColor(hexString: "#ef4351")
        v1.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(0)
            make.height.equalTo(200)
        }
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
