//
//  TabBarBaseViewController.swift
//  Swift_20170407
//
//  Created by 郭榜 on 2017/4/7.
//  Copyright © 2017年 com.B_crazy.new. All rights reserved.
//

import UIKit

class TabBarBaseViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self .creatTabBarUI()
    }
    
    func creatTabBarUI() -> () {
        
        let indexVC = IndexViewController()
        let indexItem = UITabBarItem(title: "首页", image: UIImage.init(named: "index"), selectedImage: UIImage.init(named: "indexSelect"))
        indexVC.tabBarItem = indexItem
        
        let setting = PersonSettingViewController()
        let settingItem = UITabBarItem(title: "设置", image: UIImage.init(named: "setting"), selectedImage: UIImage.init(named: "settingSelect"))
        setting.tabBarItem = settingItem
        
        let itmesArray = [indexVC, setting]
        self.viewControllers = itmesArray
  
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
