//
//  ViewController.swift
//  GifTest
//
//  Created by Aditya Goyal on 12/05/17.
//  Copyright © 2017 Aditya Goyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gifImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gifImageView.loadGif(name: "EmptyCard")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

