//
//  DictionaryOrStringTransformUtils.swift
//  SwiftProjectDemo
//
//  Created by 郭榜 on 2017/4/26.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

import UIKit

class DictionaryOrStringTransformUtils: NSObject {
    
    func dictionaryToJSONString(dict:NSDictionary?)->String{
        
        
        let data = try? JSONSerialization.data(withJSONObject: dict!, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let strJson = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
        
        return strJson! as String
        
    }
    
    

}
