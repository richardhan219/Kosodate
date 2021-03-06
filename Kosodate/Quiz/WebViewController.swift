//
//  WebViewController.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/7/10.
//  Copyright © 2018年 Richard Han. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var WebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "子育て生活自己診断システム"
        let url = URL(string: "http://arigato-project.jp/publicarigato/page01.asp")
        let request = URLRequest(url: url!)
        WebView.loadRequest(request)
        // Do any additional setup after loading the view.
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
