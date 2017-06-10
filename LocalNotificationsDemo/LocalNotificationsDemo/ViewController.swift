//
//  ViewController.swift
//  LocalNotificationsDemo
//
//  Created by Codekul on 04/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(self.changeLableText), name: Notification.Name(rawValue: "MyNotif"), object: nil)
        
    }

    func changeLableText(sender : Notification) {
        
        let str = sender.object as! String
        
        lbl.text = str;
        
        print("Hello")
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

