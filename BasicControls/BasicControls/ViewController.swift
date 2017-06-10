//
//  ViewController.swift
//  BasicControls
//
//  Created by Codekul on 19/02/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var myLabel : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel = UILabel(frame: CGRect(x: 10, y: 20, width: 300, height: 30))
        
        myLabel!.text = "Welcome to codekul"
        myLabel!.textAlignment = .center
        
        myLabel!.textColor = UIColor.red
        
        
        let myButton = UIButton(frame: CGRect(x: 110, y: myLabel!.frame.origin.y + myLabel!.frame.size.height + 20, width: 100, height: 30))
        
        
        myButton.setTitle("Go", for: .normal)
        
        myButton.setTitleColor(UIColor.gray, for: .normal)
        myButton.backgroundColor = UIColor.cyan
        
        myButton.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        
        self.view.addSubview(myButton)
        self.view.addSubview(myLabel!)
        
    }
    
    func buttonClicked(_ sender : UIButton) {
        
        myLabel!.text = "Hi, there !"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

