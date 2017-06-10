//
//  ViewController.swift
//  JsonParsingGetReq
//
//  Created by Codekul on 27/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class practiceControllerGET: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let req = URLRequest(url: URL(string : "https://api.myjson.com/bins/ajzl1")!)
        
        let dataTask = URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            if error == nil {
                do {
                    let rootDict = try JSONSerialization.jsonObject(with: data!, options: []) as! [String : Any]
                    
                    print("classId : \(rootDict["classId"]!)")
                    print("name : \(rootDict["name"]!)")
                    print("address : \(rootDict["address"]!)")
                    print("\n")
                    
                    let coursesArray = rootDict["courses"] as! Array<[String : Any]>
                    
                    for course in coursesArray {
                        print("Name: \(course["name"]!) timings: \(course["timings"]!)")
                        
                        print("Syllabus:")
                        let syllabusArray = course["syllabus"] as! Array<String>
                        for syllabus in syllabusArray {
                            print("   \(syllabus)")
                        
                        }
                        print("\n")
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

