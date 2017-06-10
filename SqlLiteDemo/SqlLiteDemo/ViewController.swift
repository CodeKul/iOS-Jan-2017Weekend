//
//  ViewController.swift
//  SqlLiteDemo
//
//  Created by Aditya Goyal on 14/05/17.
//  Copyright © 2017 Aditya Goyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var txtRno : UITextField!
    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtMarks : UITextField!
    
    var db : OpaquePointer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.openDB()
    }
    
    func openDB() {
        let fileManager = FileManager.default
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fullDestPath = URL(fileURLWithPath: documentDirectoryPath).appendingPathComponent("StudentInfo.plist")
        let destinationPath = fullDestPath.path
        
        print (destinationPath)
        
        if !fileManager.fileExists(atPath: destinationPath) {
            let sourcePath = Bundle.main.path(forResource: "StudentDB", ofType: "db")
            try! fileManager.copyItem(atPath: sourcePath!, toPath: destinationPath)
        }
        
        if sqlite3_open(destinationPath, &db) != SQLITE_OK {
            print("error opening database")
        }
    }
    
    @IBAction func saveClicked(_ sender : UIButton) {
        
        if sqlite3_exec(db, "INSERT INTO StudentInfo VALUES ('\(txtRno.text!)', '\(txtName.text!)','\(txtMarks.text!)')", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error creating table: \(errmsg)")
        }
        else {
            print("Data saved successfully")
        }
        self.textClearTextField()
    }
    
    @IBAction func showClicked(_ sender : UIButton) {
        
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, "SELECT * FROM StudentInfo", -1, &statement, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error preparing select: \(errmsg)")
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            let rno = sqlite3_column_text(statement, 0)
            let rnoString = String(cString: rno!)
            print("rno = \(rnoString)")
            
            if let name = sqlite3_column_text(statement, 1) {
                let nameString = String(cString: name)
                print("name = \(nameString)")
            } else {
                print("name not found")
            }
            if let marks = sqlite3_column_text(statement, 2) {
                let marksString = String(cString: marks)
                print("marks = \(marksString)")
            } else {
                print("marks not found")
            }
        }
        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error finalizing prepared statement: \(errmsg)")
        }
        statement = nil
    }
    
    @IBAction func search(_ sender : UIButton) {
        
        var statement: OpaquePointer? = nil
        let sqlStatement = "SELECT * FROM StudentInfo WHERE rno = '\(txtRno.text!)'"
        
        if sqlite3_prepare_v2(db, sqlStatement , -1, &statement, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error preparing select: \(errmsg)")
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            let rno = sqlite3_column_text(statement, 0)
            let rnoString = String(cString: rno!)
            print("rno = \(rnoString)")
            
            self.txtRno.text = "\(rnoString)"
            
            
            
            if let name = sqlite3_column_text(statement, 1) {
                let nameString = String(cString: name)
                print("name = \(nameString)")
                self.txtName.text = nameString
            } else {
                print("name not found")
            }
            if let marks = sqlite3_column_text(statement, 2) {
                let marksString = String(cString: marks)
                print("marks = \(marksString)")
                self.txtMarks.text = marksString
            } else {
                print("marks not found")
            }
        }
        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error finalizing prepared statement: \(errmsg)")
        }
        statement = nil
    }
    
    @IBAction func deleteButtonPressed(_ sender : UIButton) {
        

        let sqlStatement = "DELETE from StudentInfo WHERE rno = '\(txtRno.text!)'"
        
        if sqlite3_exec(db, sqlStatement , nil, nil, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error preparing select: \(errmsg)")
        }else{
            print("Deleted entry successfully")
        }
        
        self.textClearTextField()
    }

    
    @IBAction func updateButtonPressed(_ sender : UIButton) {
        
        let sqlStatement = "UPDATE StudentInfo set name='\(txtName.text!)', marks='\(txtMarks.text!)' WHERE rno = '\(txtRno.text!)'"
        
        if sqlite3_exec(db, sqlStatement , nil, nil, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error preparing select: \(errmsg)")
        }else{
            print("Updated entry successfully")
        }
        
        self.textClearTextField()
    }

    
    func textClearTextField() {
        txtRno.text = ""
        txtName.text = ""
        txtMarks.text = ""
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
