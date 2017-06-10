//
//  ViewController.swift
//  SliderMenuDemo
//
//  Created by Varun on 13/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var leadingConstraints : NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func menuButtonClick(_ sender : UIButton) {
        
        sender.isEnabled = false

        if leadingConstraints.constant == 0 {
            leadingConstraints.constant = -200
        }
        else {
            leadingConstraints.constant = 0
        }
        
//        UIView.animate(withDuration: 0.3) {
//            
//            self.view.layoutIfNeeded()
//        }
        
        UIView.animate(withDuration: 2, animations: { 
            self.view.layoutIfNeeded()

        }) { (isDone) in
            sender.isEnabled = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

