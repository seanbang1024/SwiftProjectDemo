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
import ESPullToRefresh


class IndexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var modelArray = [IndexListModel]()
    var tableView = UITableView()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        
        createUI()
        getData1()
        
        self.tableView.es_startPullToRefresh()
        

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.navigationItem.title = "首页"
        
    }
    
    func createUI() -> () {
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH - kTabBarH - kStatusBarH - kNavBarH), style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(IndexTableViewCell.self, forCellReuseIdentifier: "indexCell")
        
//        self.tableView.showsVerticalScrollIndicator = false
//        self.tableView.showsHorizontalScrollIndicator = false
//        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        


        
        self.tableView.es_addInfiniteScrolling {
            [unowned self] in
            /// Do anything you want...
            /// ...
            /// If common end
            self.tableView.es_stopLoadingMore()
            /// If no more data
            self.tableView.es_noticeNoMoreData()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(indexPath.row)
        
        let d = DetailsViewController()
        self.navigationController?.pushViewController(d, animated: true)
        

//        //        这个是处理逻辑
//        d.completed = {
//            (isFinish: Bool ) in
//            print(isFinish)
//        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return self.modelArray.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        print(indexPath.row)
//        
//        var hegiht:CGFloat = 0.0
//        if self.modelArray.count > indexPath.row {
//            let cell = IndexTableViewCell()
//            cell.setData(model: self.modelArray[indexPath.row])
//            hegiht = cell.cellH
//        }
//        return hegiht
//        
////        var hegiht:CGFloat = 0.0
////
////        if (self.modelArray.count > indexPath.row) {
////            
////            let model:IndexListModel = self.modelArray[indexPath.row]
////            hegiht = model.cellHeight
////        }
////        return hegiht
//
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: "indexCell") as? IndexTableViewCell
//        if cell == nil {
//            cell = IndexTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "indexCell")
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "indexCell", for: indexPath) as? IndexTableViewCell
        
        if self.modelArray.count > indexPath.row {
            
            cell?.setData(model: self.modelArray[indexPath.row], indexrow: indexPath.row)
            
        }


        return cell!
        
    }
    
    func getData() -> () {
        
        
        self.tableView.es_addPullToRefresh {
            [unowned self] in
            
            
            let urlString = "http://api.juheapi.com/japi/toh"
            let parameters = ["key" : kJuheKey, "v" : "1.0", "month" : "8", "day" : "21"]
            HttpTools.requestData(.get, URLString: urlString, parameters: parameters) { (result) in
                self.modelArray.removeAll()
                self.tableView.es_stopPullToRefresh()
                
                
                
                
                guard let dict = result as? [String : Any] else { return }
                
                let arr:NSArray = dict["result"] as! NSArray
                
                for obj in arr {
                    let object = JSONDeserializer<IndexListModel>.deserializeFrom(dict: obj as? NSDictionary)
                    
                    self.modelArray.append(object!)
                    
                }
                self.tableView.reloadData()
                
                
                
                print(self.modelArray.count)
                print("==========")
            }
            
            
            
            /// Set ignore footer or not
            //            self.tableView.es_stopPullToRefresh(ignoreDate: true, ignoreFooter: false)
        }
        
        
        
        
    }
    
    
    func getData1() -> () {
        
        self.tableView.es_addPullToRefresh {
            [unowned self] in
            
            let path = Bundle.main.path(forResource:"Main1",
                                        ofType: "json")
            
            let url = URL(fileURLWithPath: path!)
            
            do{
                
                let data = try Data(contentsOf: url)
                
                let json:Any = try JSONSerialization.jsonObject(with:
                    data, options:JSONSerialization.ReadingOptions.mutableContainers)
                //            let jsonDic: Dictionary = json
                let jsonDic = json as!Dictionary<String,Any>
                
                let datalist = jsonDic["result"]as!NSArray
                
                for obj in datalist {
                    let object = JSONDeserializer<IndexListModel>.deserializeFrom(dict: obj as? NSDictionary)
                    
                    self.modelArray.append(object!)
                    
                }
                self.tableView.es_stopPullToRefresh()
                self.tableView.reloadData()
                
            }catch let error as NSError{
                
                print("解析出错: \(error.localizedDescription)")
                self.tableView.es_stopPullToRefresh()
                
            }
            
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
