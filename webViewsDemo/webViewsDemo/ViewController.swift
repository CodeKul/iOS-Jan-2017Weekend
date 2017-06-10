//
//  ViewController.swift
//  webViewsDemo
//
//  Created by Codekul on 19/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

    @IBOutlet var webView : UIWebView!
    @IBOutlet var activityIndicator : UIActivityIndicatorView!
    @IBOutlet var urlSearchField :UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let req = URLRequest(url: URL(string : "http://www.codekul.com")!)
//        webView.loadRequest(req)
        
        
        
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        let requestUrl = URLRequest(url: URL(string : "http://" + textField.text!)!)
        
        print(textField.text!)
        
        webView.loadRequest(requestUrl)
        
        return true
    }
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        activityIndicator.startAnimating()
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        
        let urlString = request.url?.absoluteString
        
        if (urlString?.contains("facebook"))! {
            print("Blocked dude")
            return false
        }
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

