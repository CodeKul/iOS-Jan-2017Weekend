//
//  ViewController.swift
//  userDefaultsPractice
//
//  Created by Varun on 13/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView : UITableView!
    var studentsData : Array<[String:String]>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! tableViewCellClass
        
        
//        var studentObj = self.studentsData
        
        myCell.marks.text = self.studentsData![indexPath.row]["marks"]
        myCell.name.text = self.studentsData![indexPath.row]["name"]
        myCell.rollNo.text = self.studentsData![indexPath.row]["rollNo"]
        
        return myCell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
//        let path = Bundle.main.path(forResource: "StudentInfo", ofType: "plist")
//        let plistData = NSMutableArray(contentsOfFile: path!)
        
        
        let bundlePath = Bundle.main.path(forResource: "StudentInfo", ofType: "plist")
        
        print(bundlePath!,"\n")
        
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let fullDestPath = URL(fileURLWithPath: destPath).appendingPathComponent("StudentInfo.plist")
        let fullDestPathString = fullDestPath.path
        
        print(fileManager.fileExists(atPath: bundlePath!))
        
        do{
            let plistData = NSMutableArray(contentsOfFile: fullDestPathString)
            
            if plistData == nil {
                print("empty data")
            }else{
                
                self.studentsData = plistData! as! Array<[String : String]>
                tableView.reloadData()
            }
        }
        
        
        /* Code for storing object in UserDefaults
        self.studentsData = UserDefaults.standard.value(forKey: "students") as! Array<[String:String]>?
 
        
        self.studentsData = [rootDictionary! as! Dictionary<String, String>]
        
        if self.studentsData == nil {
            print("empty data")
        }else{
            tableView.reloadData()
        }
        */
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.studentsData == nil {
            return 0
        }else{
            return self.studentsData!.count
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "studentTableItem", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addViewController = segue.destination as! AddStudentController
        addViewController.indexNumberOfStudentToBeEdited = self.tableView.indexPathForSelectedRow?.row
    }
    
}

