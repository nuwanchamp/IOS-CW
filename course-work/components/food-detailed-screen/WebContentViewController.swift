//
//  WebContentViewController.swift
//  course-work
//
//  Created by user229897 on 1/6/23.
//

import UIKit
import WebKit

class WebContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = WKWebView()
        view.addSubview(webView)
        
        webView.frame = view.bounds
        
        let htmlString = "<html><head><meta name='viewport' content='width=device-width, initial-scale=1'></head><body style='padding:40px 20px;background-color: #1C1D27; font-family: \"Helvetica Neue\", sans-serif; color:#fff'><h1 style='font-size:20px; font-weight:bold;'>Hello World!</h1><p style='font-size: 15px'>This is some HTML content.</p></body></html>"

        webView.loadHTMLString(htmlString, baseURL: nil)
        
    }
    

}
