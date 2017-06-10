//
//  CreateView.swift
//  SlderMenuDemo
//
//  Created by Codekul on 22/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation
import UIKit

class CreateView{
    
    public func getToastView() -> UIView{
        
        let viewForToast = UIView(frame: CGRect(x: 0, y: 0, width:0 , height: 0))
        
        let toastLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 320, height: 40))
        
        toastLabel.text = "Toast Message"
        
        viewForToast.addSubview(toastLabel)
        
        
        viewForToast.backgroundColor = UIColor.red
        
        viewForToast.translatesAutoresizingMaskIntoConstraints = false
        
        
       
        
//        NSLayoutConstraint(item: viewForToast, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 60.0).isActive = true
        
//        NSLayoutConstraint(item: viewForToast, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 100).isActive = true
        
//        NSLayoutConstraint(item: toastLabel, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: viewForToast, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 20.0).isActive = true
//        
//        NSLayoutConstraint(item: toastLabel, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: viewForToast, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: 20.0).isActive = true
        
//        NSLayoutConstraint(item: toastLabel, attribute: NSLayoutAttribute.bottomMargin, relatedBy: NSLayoutRelation.equal, toItem: viewForToast, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 10.0).isActive = true
        
//        NSLayoutConstraint(item: toastLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: viewForToast, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 10.0).isActive = true
        
       
        
        
        return viewForToast
        
    }
    
}
