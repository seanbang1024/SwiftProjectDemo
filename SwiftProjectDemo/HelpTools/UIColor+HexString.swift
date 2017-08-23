//
//  UIColor+HexString.swift
//  SwiftProjectDemo
//
//  Created by 郭榜 on 2017/8/23.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func hexStringToColor(hexString: String) -> UIColor{
        
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if cString.characters.count < 6 {
            
            return UIColor.white
        }
        if cString.hasPrefix("0X") || cString.hasPrefix("0x") {
            
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 2))
        }
        if cString.hasPrefix("#") {
            
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
        }
        if cString.characters.count != 6 {
            
            return UIColor.white
        }
        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1))
  
    }
  
}
