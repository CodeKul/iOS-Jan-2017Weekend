//
//  ViewController.swift
//  PickerViewDemo
//
//  Created by Codekul on 07/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var arrData : Array<String>?
    var arrData1 : Array<String>?
    override func viewDidLoad() {
        super.viewDidLoad()

        arrData = ["Red", "Green", "Blue", "Orange", "Yellow", "Black", "White"]
        arrData1 = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

        self.view.backgroundColor = UIColor.red
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return (arrData?.count)!
        }
        else {
            return (arrData1?.count)!
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return arrData?[row]
        }
        return arrData1?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 160.0, height: 30))
        if component == 0 {
            lbl.text = arrData?[row]
        }
        else {
            lbl.text = arrData1?[row]
        }
        
        lbl.textColor = UIColor.blue
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.gray
        
        return lbl
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            var color : UIColor?
            
            switch row {
            case 0:
                color = UIColor.red
            case 1:
                color = UIColor.green
            case 2:
                color = UIColor.blue
            case 3:
                color = UIColor.orange
            case 4:
                color = UIColor.yellow
            case 5:
                color = UIColor.black
            case 6:
                color = UIColor.white
            default:
                color = UIColor.gray
            }
            self.view.backgroundColor = color
        }
        else {
            print("\(arrData1?[row])")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

