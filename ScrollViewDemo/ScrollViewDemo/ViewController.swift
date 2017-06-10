//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by Codekul on 19/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var contentView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    scrollView.contentSize = contentView.frame.size
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

