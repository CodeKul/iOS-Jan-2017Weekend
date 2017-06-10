//
//  ViewController.swift
//  RGBSlider
//
//  Created by Aditya Goyal on 25/02/17.
//  Copyright © 2017 Aditya Goyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorPaletteView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.minimumTrackTintColor = UIColor(colorLiteralRed: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        greenSlider.minimumTrackTintColor = UIColor(colorLiteralRed: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        blueSlider.minimumTrackTintColor = UIColor(colorLiteralRed: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redSliderValueChange(_ sender: UISlider) {
        
        redLabel.text = "Red : \(Int(sender.value))"
        self.setColorPaletteViewColor();
        
    }
    
    @IBAction func greenSliderValueChanged(_ sender: UISlider) {
        greenLabel.text = "Green : \(Int(sender.value))"
        self.setColorPaletteViewColor();
    }
    

    @IBAction func blueSliderValueChanged(_ sender: UISlider) {
        blueLabel.text = "Blue : \(Int(sender.value))"
        self.setColorPaletteViewColor();
    }
    
    @IBAction func redSwitchValueChanged(_ sender: UISwitch) {
        if sender.isOn{
            redSlider.isUserInteractionEnabled = true
            
            redSlider.minimumTrackTintColor = UIColor(colorLiteralRed: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            
        }else{
            redSlider.isUserInteractionEnabled = false
            redSlider.minimumTrackTintColor = UIColor(colorLiteralRed: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        }
    }
    
    @IBAction func greenSwitchValueChanged(_ sender: UISwitch) {
        if sender.isOn{
            greenSlider.isUserInteractionEnabled = true
            
            greenSlider.minimumTrackTintColor = UIColor(colorLiteralRed: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
            
        }else{
            greenSlider.isUserInteractionEnabled = false
            greenSlider.minimumTrackTintColor = UIColor(colorLiteralRed: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        }
    }
    
    
    @IBAction func blueSwitchValueChanged(_ sender: UISwitch) {
        if sender.isOn{
            blueSlider.isUserInteractionEnabled = true
            blueSlider.minimumTrackTintColor = UIColor(colorLiteralRed: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        }else{
            blueSlider.isUserInteractionEnabled = false
            blueSlider.minimumTrackTintColor = UIColor(colorLiteralRed: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        }
    }
    
    
    func setColorPaletteViewColor(){
        colorPaletteView.backgroundColor = UIColor(colorLiteralRed: redSlider.value/255, green: greenSlider.value/255, blue: blueSlider.value/255, alpha: 1.0)
    }
}

