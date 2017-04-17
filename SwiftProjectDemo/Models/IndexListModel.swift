//
//  IndexListModel.swift
//  SwiftProjectDemo
//
//  Created by 郭榜 on 2017/4/13.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

import UIKit
import HandyJSON

class IndexListModel: HandyJSON {
    
    var _id:Int?;
    var day:String?;//名称
    var des:String?;//食物
    var lunar:String?;//图片
    var month:String?;//图片,
    var pic:String?;//描述
    var title:String?;//关键字
    var year:String?;//资讯内容
    
    required init() {}

}

//"_id" = 8140413;
//day = 13;
//des = "\U57281203\U5e74\U524d\U7684\U4eca\U5929\Uff0c0814\U5e744\U670813\U65e5 (\U519c\U5386\U4e09\U6708\U5341\U4e5d)\Uff0c\U4fdd\U52a0\U5229\U4e9a\U5927\U516c\U514b\U9c81\U59c6\U901d\U4e16\U3002";
//lunar = "\U7532\U5348\U5e74\U4e09\U6708\U5341\U4e5d";
//month = 4;
//pic = "";
//title = "\U4fdd\U52a0\U5229\U4e9a\U5927\U516c\U514b\U9c81\U59c6\U901d\U4e16";
//year = 814;




