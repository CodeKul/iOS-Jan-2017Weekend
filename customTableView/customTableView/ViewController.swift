//
//  ViewController.swift
//  customTableView
//
//  Created by Varun on 18/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var players : Array<Players> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        players.append(Players("Virat", "Kohli", "Virat.jpg"))
        players.append(Players("Sachin", "Tendulkar", "Sachin.jpg"))
        players.append(Players("Mahendra Singh", "Singh", "Dhoni.jpg"))
        players.append(Players("Yuvraj", "Singh", "Yuvraj.jpg"))
        players.append(Players("Suresh", "Raina", "Suresh.jpg"))
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "mycell") as! MyCustomCellClass
        
        myCell.fName.text = players[indexPath.row].fName
        myCell.lName.text =  players[indexPath.row].lName
        myCell.userImage.image = UIImage(named: players[indexPath.row].imageUrl)
        
        myCell.imageButton.tag = indexPath.row
        myCell.imageButton.addTarget(self, action: #selector(imageButtonTapped), for: UIControlEvents.touchUpInside)
        
        return myCell
        
    }

    func imageButtonTapped(_ button : UIButton){
        print(players[button.tag].fName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

