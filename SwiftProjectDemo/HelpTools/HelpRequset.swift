//
//  HelpRequset.swift
//  Swift_20170407
//
//  Created by 郭榜 on 2017/4/7.
//  Copyright © 2017年 com.B_crazy.new. All rights reserved.
//

import UIKit

import Alamofire

var parametersDic : [String : Any]?
var methodType : MethodType!
var urlString : String!

enum MethodType {
    case get
    case post
}


class HttpTools {
    //参数的finishedCallback闭包使用了，而使用的环境又是一个闭包，则需要加@escaping
    
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error as Any)
                return
            }
            finishedCallback(result)
        }
    }
 
}


