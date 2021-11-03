//
//  InternetViewController.swift
//  GroupProject
//
//  Created by Daniel Brannon on 11/2/21.

//https://www.bottlerocketstudios.com
import UIKit
import WebKit
class InternetViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var webView: WKWebView!
    
//    var webView = WKWebView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.navigationDelegate = self
        
        guard let url = URL(string:"https://www.apple.com") else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    @IBAction func backButton(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        nextButton.isEnabled = webView.canGoForward
        
    }
}
