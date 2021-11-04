//
//  InternetViewController.swift
//  GroupProject
//
//  Created by Daniel Brannon on 11/2/21.
// https:.//www.bottlerocketstudios.com
import UIKit
import WebKit

class InternetViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    var webView: WKWebView!
    var delegate: MainViewControllerDelegate?
    @IBAction func backButtonPressed(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func refreshButtonPressed(_ sender: Any) {
        webView.reload()
    }
    @IBAction func forwardButtonPressed(_ sender: Any) {
        webView.goForward()
    }
    
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
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
    }
}

