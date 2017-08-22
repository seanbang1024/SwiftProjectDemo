//
//  DetailsViewController.swift
//  SwiftProjectDemo
//
//  Created by 郭榜 on 2017/4/26.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
//    typealias completedBlock = (Bool) -> Void
//    
//    var completed : completedBlock!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange
        self.title = "详情"
        print(self.navigationController as Any)
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.red
        
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(btn)
        btn.addTarget(self, action:#selector(btnAction) , for: .touchUpInside)
        
    }
    
    func btnAction() -> () {
        
        //一般形式
        
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
