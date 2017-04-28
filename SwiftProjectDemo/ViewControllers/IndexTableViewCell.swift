//
//  IndexTableViewCell.swift
//  SwiftProjectDemo
//
//  Created by 郭榜 on 2017/4/26.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

import UIKit
import Kingfisher

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
    var cellHegiht: CGFloat!
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 设置选中cell时无高亮等效果
        self.selectionStyle = .none
        self.backgroundColor = UIColor.white
        
        self.titleLable = UILabel(frame: CGRect(x: 10, y: 10, width: kScreenW, height: 50))
        self.addSubview(self.titleLable)
        
        self.picImage = UIImageView(frame: CGRect(x: self.titleLable.LeftX, y: self.titleLable.BottomY, width: 100, height: 100))
        self.addSubview(self.picImage)
        
        self.desLable = UILabel(frame: CGRect(x: self.picImage.RightX + 10, y: self.picImage.TopY, width: kScreenW - 20 - self.picImage.RightX, height: self.picImage.Height))
        self.addSubview(desLable)
        self.desLable.numberOfLines = 0
        
        self.timeLable = UILabel(frame: CGRect(x: self.picImage.LeftX, y: self.picImage.BottomY + 10, width: kScreenW - 20, height: 30))
        self.addSubview(self.titleLable)
        
        
 
    }
    
    func setData(model: IndexListModel) -> () {
        
        self.titleLable.text = model.title
        let url = URL(string: model.pic!)
        self.picImage.kf.setImage(with: url)
        self.desLable.text = model.des
//        self.titleLable
        self.cellHegiht = self.timeLable.BottomY
        
        
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
