//
//  IndexTableViewCell.swift
//  SwiftProjectDemo
//
//  Created by 郭榜 on 2017/4/26.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit
class IndexTableViewCell: UITableViewCell {
    
//    "_id" = 16950413;
//    day = 13;
//    des = "在322年前的今天，1695年4月13日 (农历三月初一)，法国诗人让·德·拉封丹逝世。";
//    lunar = "乙亥年三月初一";
//    month = 4;
//    pic = "http://juheimg.oss-cn-hangzhou.aliyuncs.com/toh/201004/11/2C175535280.jpg";
//    title = "法国诗人让·德·拉封丹逝世";
//    year = 1695;
    
    
    var titleLable: UILabel!
    var desLable: UILabel!
    var lunarLable: UILabel!
    var timeLable: UILabel!
    var picImage: UIImageView!
    var cellH: CGFloat!
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 设置选中cell时无高亮等效果
        self.selectionStyle = .none
        self.backgroundColor = UIColor.white
        
        self.titleLable = UILabel()
        self.addSubview(self.titleLable)
        
        self.picImage = UIImageView()
        self.addSubview(self.picImage)
        self.picImage.backgroundColor = UIColor.red
        
        self.desLable = UILabel()
        self.addSubview(desLable)
        self.desLable.numberOfLines = 0
        
        self.timeLable = UILabel()
        self.addSubview(self.timeLable)
        
    
        

        
        self.titleLable.snp.makeConstraints { (make) in
            
            make.left.top.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(50)
            
        }

        
        self.picImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.titleLable.snp.bottom).offset(10)
            make.left.equalTo(self.titleLable.snp.left)
            make.width.height.equalTo(100)
            
            
        }

        self.desLable.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.picImage.snp.top)
            make.left.equalTo(self.picImage.snp.right).offset(10)
            make.right.equalTo(-10)
            make.bottom.greaterThanOrEqualTo(self.picImage.snp.bottom)
        }
        
        self.timeLable.snp.makeConstraints { (make) in
        
            make.top.equalTo(self.desLable.snp.bottom).offset(10)
            make.left.equalTo(self.titleLable.snp.left)
            make.right.equalTo(self.titleLable.snp.right)
            make.height.equalTo(self.titleLable.snp.height)
            make.bottom.equalTo(-10)
        }
        
        
        
 
    }
    
    func setData(model: IndexListModel, indexrow: NSInteger) -> () {
        
        self.titleLable.text = model.title
        let url = URL(string: model.pic!)
        self.picImage.kf.setImage(with: url)
        self.desLable.text = model.des
        self.timeLable.text = "\(model.year!)年\(model.month!)月\(model.day!)日"

////        model.cellHeight = self.timeLable.BottomY
////        self.cellH = self.timeLable.BottomY
//
//        let picH = self.picImage.Height
//        let desH = self.desLable.Height
//        
//        print("pich    " + "\(picH)")
//        print("desH    " + "\(desH)")
//        print("indexrow    " + "\(indexrow)")
//        
//        self.timeLable.snp.removeConstraints()
//        if picH >= desH {
////        if indexrow == 4 {
//            
//            self.timeLable.snp.updateConstraints { (make) in
//                
//                make.top.equalTo(self.picImage.snp.bottom).offset(10)
//                make.left.equalTo(self.titleLable.snp.left)
//                make.right.equalTo(self.titleLable.snp.right)
//                make.height.equalTo(self.titleLable.snp.height)
//                make.bottom.equalTo(-10)
//
//            }
//            
//        } else {
//            
//            self.timeLable.snp.updateConstraints({ (make) in
//                
//                make.top.equalTo(self.desLable.snp.bottom).offset(10)
//                make.left.equalTo(self.titleLable.snp.left)
//                make.right.equalTo(self.titleLable.snp.right)
//                make.height.equalTo(self.titleLable.snp.height)
//                make.bottom.equalTo(-10)
//
//                
//            })
//            
//            
//        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
