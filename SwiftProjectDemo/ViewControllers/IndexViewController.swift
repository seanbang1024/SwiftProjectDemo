//
//  IndexViewController.swift
//  Swift_20170407
//
//  Created by 郭榜 on 2017/4/7.
//  Copyright © 2017年 com.B_crazy.new. All rights reserved.
//

import UIKit


class IndexViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.blue
        getData()
        
        
    }
    
    
    func getData() -> () {

//        let parameters = ["foo": "bar"]
//        let urlString = "https://httpbin.org/get"
        
        let urlString = "http://api.juheapi.com/japi/toh"
        let parameters = ["key" : "7528a751b7a7e3772a9845114b0d9e51", "v" : "1.0", "month" : "4", "day" : "13"]

        HttpTools.requestData(.get, URLString: urlString, parameters: parameters) { (result) in
            
            print(result)
            guard let dict = result as? [String : Any] else { return }
            guard let arr = dict["data"] as? [[String : Any]] else { return }
            print(arr)
            

        }

 
        

        
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
