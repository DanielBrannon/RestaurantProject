//
//  InternetViewController.swift
//  RestaurantApp
//
//  Created by Limei  Chen on 11/2/21.
//

//https://www.bottlerocketstudios.com
import Foundation
import WebKit

class InternetViewController: UIViewController, WKUIDelegate {
    var webView = WKWebView()
    
    

    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView

    }
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let myURL = URL(string:"https://www.bottlerocketstudios.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
