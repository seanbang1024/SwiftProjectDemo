//
//  PersonSettingViewController.swift
//  Swift_20170407
//
//  Created by 郭榜 on 2017/4/7.
//  Copyright © 2017年 com.B_crazy.new. All rights reserved.
//

import UIKit
import WebKit

class PersonSettingViewController: UIViewController, UIWebViewDelegate {

    var web : UIWebView!
    var wkweb: WKWebView!
    var actV: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        
        self.tabBarController?.navigationItem.title = "设置"
        
        web = UIWebView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH - kStatusAddNavH))
        self.view.addSubview(web)
        let url = URLRequest(url: URL(string: "http://www.baidu.com")!)
        web.loadRequest(url)
        web.delegate = self;
        web.sizeToFit()
//        web.layer.masksToBounds = true
//        web.layer.cornerRadius = 20
        
        actV = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.view.addSubview(actV)
        actV.center = self.view.center
        actV.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        
        
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        actV.startAnimating()
        
        
    }
    
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        actV.stopAnimating()
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
        
    }
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        replaceSpace(s: "We Are Happy.")
        

    }
    
//    请实现一个函数，将一个字符串中的空格替换成“%20”。例如，当字符串为We Are Happy.则经过替换之后的字符串为We%20Are%20Happy。
    func replaceSpace(s: String) -> () {
        
        let s1 = s.replacingOccurrences(of: " ", with: "%")
        print(s1)
        
        
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
