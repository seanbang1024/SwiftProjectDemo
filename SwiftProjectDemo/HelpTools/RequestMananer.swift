//
//  RequestMananer.swift
//  SwiftProjectDemo
//
//  Created by 郭榜 on 2017/8/23.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

import UIKit
import Alamofire


protocol RequestDelegate {
    var URLString : String {get}
    var type : MethodType {get}
    var parameters : [String : Any] {get}
    associatedtype ResultData
    var parseData : ResultData {get}
    func parseResult(_ result : Any)//MARK:- result由协议完成
}

extension RequestDelegate {
    //只传闭包 其他不要了 _ type : MethodType, URLString : String, parameters : [String : Any]? = nil, 此三者由协议完成
    func requestData(finishedCallback :  @escaping () -> ()) {//MARK:- (_ result : Any) -> () result由协议parseResult完成 1
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(self .addCommonUrl(), method: method, parameters: self.addCommonParams()).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error ?? " --- 网络请求发生了错误 --- ")
                return
            }
            self.parseResult(result)//MARK:- result由协议完成 3
            finishedCallback()//MARK:- finishedCallback(result) result由协议完成 2
        }
    }
    
//添加公共url
    private func addCommonUrl() -> String {
        var url = ""
        url = url.appending(URLString)
        return url
    }
//添加公共属性。类似token，sign 等
    private func addCommonParams() -> Dictionary<String, Any> {
        
        var dic = Dictionary<String, Any>()
        
        dic = parameters
//        dic.updateValue("", forKey: "")
        
        return dic
        
        
    }
    
    
    
}
