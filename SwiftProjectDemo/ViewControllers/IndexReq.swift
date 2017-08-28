//
//  IndexReq.swift
//  SwiftProjectDemo
//
//  Created by 郭榜 on 2017/8/23.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

import UIKit
import Foundation
import HandyJSON
import SwiftyJSON

class IndexReq: NSObject, RequestDelegate {

    var URLString: String = "http://api.juheapi.com/japi/toh"
    var type : MethodType = .get
    var parameters : [String:Any] = ["key" : kJuheKey, "v" : "1.0", "month" : "8", "day" : "21"]
    typealias ResultData = [IndexListModel]
    var parseData : Array<IndexListModel> = []
    
    
}

extension IndexReq {
    
    func parseResult(_ result : Any) {
        
        guard let resultDict = result as? [String:Any] else {return}
        
        let arr:NSArray = resultDict["result"] as! NSArray
        
        for obj in arr {
            let object = JSONDeserializer<IndexListModel>.deserializeFrom(dict: obj as? NSDictionary)
            
            self.parseData.append(object!)
            
        }
    }
}
