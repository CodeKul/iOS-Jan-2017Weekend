//
//  AddStudentController.swift
//  userDefaultsPractice
//
//  Created by Varun on 13/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class AddStudentController: UIViewController {
    
    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtRollNo : UITextField!
    @IBOutlet var txtMarks : UITextField!
    @IBOutlet var deleteButton : UIButton!
    @IBOutlet var addOrUpdateButton : UIButton!
    
    var indexNumberOfStudentToBeEdited : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("indexNumberOfStudentToBeEdited \(indexNumberOfStudentToBeEdited)")
        
        if indexNumberOfStudentToBeEdited == nil {
            self.deleteButton.isHidden = true
        }else{
            self.addOrUpdateButton.setTitle("Update", for: .normal)
         
            /*
            let userData = UserDefaults.standard.value(forKey: "students") as! Array<[String:String]>?
             
             self.txtName.text = userData![indexNumberOfStudentToBeEdited!]["name"]
             self.txtRollNo.text = userData![indexNumberOfStudentToBeEdited!]["rollNo"]
             self.txtMarks.text = userData![indexNumberOfStudentToBeEdited!]["marks"]
            */
            
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
                    
                    let userData = plistData! as! Array<[String : String]>
                    self.txtName.text = userData[indexNumberOfStudentToBeEdited!]["name"]
                    self.txtRollNo.text = userData[indexNumberOfStudentToBeEdited!]["rollNo"]
                    self.txtMarks.text = userData[indexNumberOfStudentToBeEdited!]["marks"]
                }
            }
 
        }
    }
    
    
    @IBAction func addButtonPressed(_ sender : UIButton){
      
         
         
        var userObj : [String : String] = [:]
        
        userObj.updateValue(txtName.text!, forKey: "name")
        userObj.updateValue(txtRollNo.text!, forKey: "rollNo")
        userObj.updateValue(txtMarks.text!, forKey: "marks")
        
         /* Code for storing object in UserDefaults
        var array = UserDefaults.standard.value(forKey: "students") as! Array<[String:String]>?
 
        
        if (array == nil){
            var arrayObj : Array<[String:String]>? = []
            
            arrayObj?.append(userObj)
            
            UserDefaults.standard.set(arrayObj, forKey: "students")
            
            UserDefaults.standard.synchronize()
        }else{
            array?.append(userObj)
            UserDefaults.standard.set(array, forKey: "students")
            
            UserDefaults.standard.synchronize()
        }
        */
        
        
        //code for plist
        //fetch data from plist file
        let bundlePath = Bundle.main.path(forResource: "StudentInfo", ofType: "plist")
        
        print(bundlePath!,"\n")
        
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let fullDestPath = URL(fileURLWithPath: destPath).appendingPathComponent("StudentInfo.plist")
        let fullDestPathString = fullDestPath.path
        
        print(fileManager.fileExists(atPath: bundlePath!))
        
        do{
            try fileManager.copyItem(atPath: bundlePath!, toPath: fullDestPathString)
        }catch{
            print("\n \(error)")
        }
        
        let arrayObj = NSMutableArray(contentsOfFile: fullDestPathString)
        
        arrayObj?.add(userObj)
        arrayObj?.write(toFile: fullDestPathString, atomically: true)
        
        print(fullDestPathString)
    }
    
    @IBAction func deleteButtonPressed(_ sender : UIButton){
        
        
        
    }

}
