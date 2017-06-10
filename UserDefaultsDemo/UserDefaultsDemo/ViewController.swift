//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Varun on 13/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblName : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var strName = UserDefaults.standard.value(forKey: "name") as! String?
        
        if strName == nil {
            strName = ""
        }
        
        lblName.text = strName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

