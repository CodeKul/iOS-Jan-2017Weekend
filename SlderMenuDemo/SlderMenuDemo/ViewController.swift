//
//  ViewController.swift
//  SlderMenuDemo
//
//  Created by Codekul on 22/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isMenuVisible : Bool?
    var isToastVisible : Bool?
    
    @IBOutlet var leadingConstraints : NSLayoutConstraint?
    @IBOutlet var leadingConstraintsForToast : NSLayoutConstraint?
    @IBOutlet var toastOuterView : UIView?
    
    var ToastView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        isMenuVisible = false
        isToastVisible = false
        
        
        self.ToastView = CreateView().getToastView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func menuButtonClicked(_ sender : UIButton) {

        self.view.layoutIfNeeded()

        if isMenuVisible! {
            isMenuVisible = false
            leadingConstraints?.constant = -200
        }
        else {
            isMenuVisible = true
            leadingConstraints?.constant = 0
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }

    }
    
    @IBAction func showToastClicked(_ sender : UIButton) {
        
        self.view.layoutIfNeeded()
        
        if !isToastVisible! {
            isToastVisible = true
            leadingConstraintsForToast?.constant = 0

            self.toastOuterView?.addSubview(self.ToastView!)
            
            NSLayoutConstraint(item: self.ToastView!, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.ToastView!.superview, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 20.0).isActive = true
            
            NSLayoutConstraint(item: self.ToastView!, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.ToastView!.superview, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: 20.0).isActive = true
            
            NSLayoutConstraint(item: self.ToastView!, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.ToastView!.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0.0).isActive = true
            
            NSLayoutConstraint(item: self.ToastView!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 60.0).isActive = true
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                
                self.ToastView?.removeFromSuperview()
                
                self.isToastVisible = false
                self.leadingConstraintsForToast?.constant = -60
                
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
            })
            
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
        
        
    }
}

