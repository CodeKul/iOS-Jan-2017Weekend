//
//  ViewController.swift
//  XMLDataParsing
//
//  Created by Codekul on 28/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITableViewDataSource,UITableViewDelegate {

    
    var breakfast_menu_array : Array<[String : Any]>?
    var food_dict : [String : Any]?
    var strData : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.w3schools.com/xml/simple.xml")
        
        let parser = XMLParser(contentsOf: url!)
        parser?.delegate = self
        parser?.parse()
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "breakfast_menu" {
            breakfast_menu_array = Array()
        }
        else if elementName == "food" {
            food_dict = Dictionary()
        }
        else {
            strData = String()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        strData?.append(string)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "breakfast_menu" {
            print(breakfast_menu_array!)
        }
        else if elementName == "food" {
            breakfast_menu_array?.append(food_dict!)
        }
        else {
            food_dict?[elementName] = strData
        }
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! tableViewCellClass
        
        cell.Name?.text = self.breakfast_menu_array?[indexPath.row]["name"] as? String
        cell.Description?.text = self.breakfast_menu_array?[indexPath.row]["description"] as? String
        cell.Calories?.text = self.breakfast_menu_array?[indexPath.row]["calories"] as? String
        cell.Price?.text = self.breakfast_menu_array?[indexPath.row]["price"] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.breakfast_menu_array?.count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

