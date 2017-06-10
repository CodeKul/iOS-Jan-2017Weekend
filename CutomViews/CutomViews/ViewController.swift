//
//  ViewController.swift
//  CutomViews
//
//  Created by Aditya Goyal on 19/02/17.
//  Copyright © 2017 Aditya Goyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textField1 : UITextField?
    var textField2 : UITextField?
    
    var resultLabel : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        
        //add 3 labels with different properties
        /*
        let nameLabel = UILabel(frame : CGRect(x: 10, y: 35, width: 300, height: 35))
        nameLabel.text = "Aditya Goyal"
        nameLabel.textAlignment = .center
        nameLabel.textColor = UIColor.blue
        self.view.addSubview(nameLabel)
        
        
        let phoneNumberLabel = UILabel(frame : CGRect(x: 10, y: 105, width: 60, height: 35))
        phoneNumberLabel.text = "8888999978"
        phoneNumberLabel.textAlignment = .left
        phoneNumberLabel.textColor = UIColor.brown
        phoneNumberLabel.adjustsFontSizeToFitWidth = true
        self.view.addSubview(phoneNumberLabel)
        
        let addressLabel = UILabel(frame : CGRect(x: 10, y: 175, width: 300, height: 70))
        addressLabel.text = "Codekul, Erandwane, Nal Stop"
        addressLabel.textAlignment = .right
        addressLabel.textColor = UIColor.red
        addressLabel.numberOfLines = 2
        self.view.addSubview(addressLabel)
 
        */
        
        
        textField1 = UITextField(frame: CGRect(x: 10, y: 30, width: 100, height: 40))
        textField1!.textColor = UIColor.black
        textField1!.borderStyle = UITextBorderStyle.line
        
        
        
        textField2 = UITextField(frame: CGRect(x: 10, y: 90, width: 100, height: 40))
        textField2!.textColor = UIColor.black
        textField2!.borderStyle = UITextBorderStyle.line
        
        self.view.addSubview(textField1!)
        self.view.addSubview(textField2!)
        
        let addButton = UIButton(frame: CGRect(x: 20, y: 150, width: 55, height: 40))
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(UIColor.black, for: .normal)
        addButton.backgroundColor = UIColor.cyan
        
        
        let subButton = UIButton(frame: CGRect(x: 95, y: 150, width: 55, height: 40))
        subButton.setTitle("-", for: .normal)
        subButton.setTitleColor(UIColor.black, for: .normal)
        subButton.backgroundColor = UIColor.cyan
        
        let mulButton = UIButton(frame: CGRect(x: 170, y: 150, width: 55, height: 40))
        mulButton.setTitle("*", for: .normal)
        mulButton.setTitleColor(UIColor.black, for: .normal)
        mulButton.backgroundColor = UIColor.cyan
        
        let divButton = UIButton(frame: CGRect(x: 245, y: 150, width: 55, height: 40))
        divButton.setTitle("/", for: .normal)
        divButton.setTitleColor(UIColor.black, for: .normal)
        divButton.backgroundColor = UIColor.cyan
        
        self.view.addSubview(addButton)
        self.view.addSubview(subButton)
        self.view.addSubview(mulButton)
        self.view.addSubview(divButton)
        
        addButton.addTarget(self, action: #selector(addButtonClicked(_ :)), for: .touchUpInside)
        subButton.addTarget(self, action: #selector(subButtonClicked(_ :)), for: .touchUpInside)
        mulButton.addTarget(self, action: #selector(mulButtonClicked(_ :)), for: .touchUpInside)
        divButton.addTarget(self, action: #selector(divButtonClicked(_ :)), for: .touchUpInside)
        
        
        resultLabel = UILabel(frame: CGRect(x: 20, y: 220, width: 280, height: 40))
        resultLabel?.textAlignment = .center
        resultLabel?.textColor = UIColor.black
        self.view.addSubview(resultLabel!)
        
    }
    
    
    func addButtonClicked(_ sender : UIButton){
        
        var value1 = 0
        var value2 = 0
        
        let optionalString: String? = textField1?.text
        if(optionalString == nil || optionalString == "")
        {
            value1 = 0
        }else{
            value1 = Int(optionalString!)!
        }
        
        let optionalString2: String? = textField2?.text
        if(optionalString2 == nil || optionalString2 == "")
        {
            value2 = 0
        }else{
            value2 = Int(optionalString2!)!
        }
        
        let answer = "\(value1 + value2)"
        resultLabel?.text = "Addition is : " + answer
    }
    
    func subButtonClicked(_ sender : UIButton){
        
        var value1 = 0
        var value2 = 0
        
        let optionalString: String? = textField1?.text
        if(optionalString == nil || optionalString == "")
        {
            value1 = 0
        }else{
            value1 = Int(optionalString!)!
        }
        
        let optionalString2: String? = textField2?.text
        if(optionalString2 == nil || optionalString2 == "")
        {
            value2 = 0
        }else{
            value2 = Int(optionalString2!)!
        }
        
        let answer = "\(value1 - value2)"
        resultLabel?.text = "Subtraaction is : " + answer
        
    }
    
    func mulButtonClicked(_ sender : UIButton){
        
        var value1 = 0
        var value2 = 0
        
        let optionalString: String? = textField1?.text
        if(optionalString == nil || optionalString == "")
        {
            value1 = 0
        }else{
            value1 = Int(optionalString!)!
        }
        
        let optionalString2: String? = textField2?.text
        if(optionalString2 == nil || optionalString2 == "")
        {
            value2 = 0
        }else{
            value2 = Int(optionalString2!)!
        }
        
        let answer = "\(value1 * value2)"
        resultLabel?.text = "Multiplication is : " + answer
        
    }
    
    func divButtonClicked(_ sender : UIButton){
        
        var value1 = 0
        var value2 = 0
        
        let optionalString: String? = textField1?.text
        if(optionalString == nil || optionalString == "")
        {
            value1 = 0
        }else{
            value1 = Int(optionalString!)!
        }
        
        let optionalString2: String? = textField2?.text
        if(optionalString2 == nil || optionalString2 == "")
        {
            value2 = 0
        }else{
            value2 = Int(optionalString2!)!
        }
        
        let answer = "\(value1 / value2)"
        resultLabel?.text = "Division is : " + answer
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning")
        // Dispose of any resources that can be recreated.
    }


}

