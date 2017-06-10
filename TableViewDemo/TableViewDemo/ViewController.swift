//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Codekul on 09/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    var arrData : Array<String>?
    var arrData1 : Array<String>?
    override func viewDidLoad() {
        super.viewDidLoad()

        arrData = ["Aditya", "Varun", "Mahesh", "Suresh", "Ramesh", "Dhoni", "Sachin", "Virat", "Ravindra", "Virender"]
        arrData1 = ["Pune", "Sangli", "Osmanabad", "Bid", "Jalna", "Ranchi", "Mumbai", "Delhi", "Surat", "Delhi"]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return (arrData?.count)!
        }
        return (arrData1?.count)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Players"
        }
        return "Cities"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        if indexPath.section == 0 {
            cell?.textLabel?.text = arrData?[indexPath.row]
        }
        else {
            cell?.textLabel?.text = arrData1?[indexPath.row]
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            print((arrData?[indexPath.row])!)
        }
        else {
            print((arrData1?[indexPath.row])!)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

