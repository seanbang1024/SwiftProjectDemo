//
//  UIView+GetFrame.swift
//  SwiftProjectDemo
//
//  Created by 郭榜 on 2017/4/27.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

import UIKit

extension UIView {
    
    var LeftX: CGFloat {
        
        get {
            
            return self.frame.origin.x
            
        }
        
    }
    
    var RightX: CGFloat {
        
        get {
            
            return self.frame.origin.x + self.bounds.width
            
        }
        
    }
    
    var TopY: CGFloat {
        
        get {
            
            return self.frame.origin.y
            
        }
        
    }
    
    var BottomY: CGFloat {
        
        get {
            
            return self.frame.origin.y + self.bounds.height
            
        }
        
    }
    
    var Width: CGFloat {
        
        get {
            
            return self.bounds.width
            
        }
        
    }
    
    var Height: CGFloat {
        
        get {
            
            return self.bounds.height
            
        }
        
    }
    
    
}



