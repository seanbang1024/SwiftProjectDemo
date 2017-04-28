//
//  IndexViewController.swift
//  Swift_20170407
//
//  Created by 郭榜 on 2017/4/7.
//  Copyright © 2017年 com.B_crazy.new. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON


class IndexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var modelArray = [IndexListModel]()
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        getData()
        createUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.navigationItem.title = "首页"
        
    }
    
    func createUI() -> () {
        self.title = "首页"
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH - kTabBarH - kStatusBarH - kNavBarH), style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let d = DetailsViewController()
        self.navigationController?.pushViewController(d, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.modelArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var hegiht:CGFloat = 0.0
        if self.modelArray.count > indexPath.row {
            let cell = IndexTableViewCell()
            cell.setData(model: self.modelArray[indexPath.row])
            hegiht = cell.cellHegiht
        }
        return hegiht
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "indexCell") as? IndexTableViewCell
        if cell == nil {
            cell = IndexTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "indexCell")
        }
//        cell?.textLabel?.text = "asdadas"
        if self.modelArray.count > indexPath.row {
            
            cell?.setData(model: self.modelArray[indexPath.row])
            
        }
        

        return cell!
        
    }
    
    
    func getData() -> () {

        
        let urlString = "http://api.juheapi.com/japi/toh"
        let parameters = ["key" : kJuheKey, "v" : "1.0", "month" : "4", "day" : "13"]
        HttpTools.requestData(.get, URLString: urlString, parameters: parameters) { (result) in
   
            guard let dict = result as? [String : Any] else { return }
            print(dict)
   
            let arr:NSArray = dict["result"] as! NSArray
            
            for obj in arr {
                let object = JSONDeserializer<IndexListModel>.deserializeFrom(dict: obj as? NSDictionary)
                print(object?.des! as Any)
                self.modelArray.append(object!)
                
            }
            self.tableView.reloadData()

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
