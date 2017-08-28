//
//  DetailsViewController.swift
//  SwiftProjectDemo
//
//  Created by 郭榜 on 2017/4/26.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

import UIKit
import SnapKit


class DetailsViewController: UIViewController {
//    typealias completedBlock = (Bool) -> Void
//    
//    var completed : completedBlock!
    typealias blockString = (String) -> Void
    var bString : blockString!
    typealias blockBack = (Void) -> Void
    var bBack : blockBack!
    
//    var bb1 : ((Void) -> (Void))?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bb1!()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange
        self.title = "详情"
        print(self.navigationController as Any)
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.hexStringToColor(hexString: "0Xfea100")
        
        self.view.addSubview(btn)
        btn.addTarget(self, action:#selector(btnAction) , for: .touchUpInside)
        
        
        let v1 = UIView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        self.view.addSubview(v1)
        v1.backgroundColor = UIColor.blue
        v1.center = self.view.center
        
        
        
        btn.snp.makeConstraints { (make) in
            
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        
    }
    
    func btnAction() -> () {
        
        //一般形式
        self.bString("sfsfsfsfsfsfsf")
        
        self.bBack()
        
        let calAdd:(Int,Int)->(Int) = {
            (a:Int,b:Int) -> Int in
            
//            self.completed(true)
            
            
            return a + b
        }
        
        print(calAdd(100,150))
        
        
        
        block()
        
        print(b1("123"))
        
    }
    
    
    let block:()->() = {
    
    }
    
    let b1:(String) -> (String) = {
        (s: String) -> String in
        
        return s
    }
    
    let b2:(String) -> (String) = {
        
        (s1:String)->(String) in
        
        return s1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
