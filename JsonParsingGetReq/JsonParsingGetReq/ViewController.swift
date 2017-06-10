//
//  ViewController.swift
//  JsonParsingGetReq
//
//  Created by Codekul on 27/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var req = URLRequest(url: URL(string : "http://192.168.0.37:7979/appStart/jobSeeker/loginUser?emailId=neha@gmail.com&password=neha123&isRecruiter=YES")!)
        do {
            
            let dict = ["emailId" : "neha@gmail.com", "password" : "neha123","isRecruiter" : "YES"] as [String : Any]
            
            req.httpBody = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
        
            req.addValue("application/json", forHTTPHeaderField: "Content-Type")
            req.httpMethod = "POST"
        }
        catch {}
        let dataTask = URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            if error == nil {
                do {
                    let rootDict = try JSONSerialization.jsonObject(with: data!, options: []) as! [String : Any]
                    
                    let colorsArray = rootDict["colorsArray"] as! Array<[String : Any]>
                    
                    for color in colorsArray {
                        print("colorName: \(color["colorName"]!)\nhexValue: \(color["hexValue"]!)\n\n")
                    }
                    
                }
                catch {
                
                }
            }
        }
        
        dataTask.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

