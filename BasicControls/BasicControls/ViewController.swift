//
//  ViewController.swift
//  BasicControls
//
//  Created by Aditya Goyal on 25/02/17.
//  Copyright © 2017 Aditya Goyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myValueLabel: UILabel!
    
    @IBOutlet weak var mySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.view.backgroundColor = UIColor.red
        }
        else if sender.selectedSegmentIndex == 1 {
            self.view.backgroundColor = UIColor.blue
        }
        else if sender.selectedSegmentIndex == 2 {
            self.view.backgroundColor = UIColor.green
        }
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        myValueLabel.text = "\(sender.value)"
        
    }
    @IBAction func switchValueChanged(_ sender: UISwitch) {
     
        if sender.isOn {
            mySlider.isUserInteractionEnabled = true
        }
        else {
            mySlider.isUserInteractionEnabled = false
        }
    }
    @IBAction func datePicked(_ sender: UIDatePicker) {
        
        let df = DateFormatter()
        df.dateFormat = "dd-MMM-yyyy"
        
        print("Date: \(df.string(from: sender.date))")
        
        

    }

}

