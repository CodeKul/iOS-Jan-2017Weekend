//
//  ViewController.swift
//  CustomCellDemo
//
//  Created by Codekul on 11/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var playersArrayData : Array<Player>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playersArrayData = Array()
        
        playersArrayData?.append(Player("Sachin.jpg", "Sachin", "India", "Batsman"))
        playersArrayData?.append(Player("Ashwin.jpg", "Ashwin", "India", "Bowler"))
        playersArrayData?.append(Player("Yuvraj.jpg", "Yuvraj", "India", "All Rounder"))
        playersArrayData?.append(Player("Afridi.jpg", "Afridi", "Pakistan", "All Rounder"))
        playersArrayData?.append(Player("Steve.jpg", "Steve Smith", "Australia", "Batsman"))
        playersArrayData?.append(Player("Stokes.jpg", "Stokes", "England", "All Rounder"))
        playersArrayData?.append(Player("Kane.jpg", "Kane Williamson", "New Zealand", "Batsman"))
        playersArrayData?.append(Player("ABD.jpeg", "AB De Villiers", "South Africa", "Batsman"))
        playersArrayData?.append(Player("Shakib.png", "Shakib Al Hasan", "Bangladesh", "All Rounder"))
        playersArrayData?.append(Player("Dhoni.jpg", "MS Dhoni", "India", "Wicket Keeper"))
        playersArrayData?.append(Player("Malinga.jpeg", "Lasith Malinga", "Sri Lanka", "Bowler"))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (playersArrayData?.count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomTableViewCell
        
        let player = (playersArrayData?[indexPath.row])!
        
        myCell?.imageView?.image = UIImage(named: player.imagePath)
        
        myCell?.playerNameLbl.text = player.playerName
        myCell?.playerCountryLbl.text = player.playerCountry
        myCell?.playerDescLbl.text = player.playerDescription
        
        myCell?.imageButton.tag = indexPath.row
        myCell?.imageButton.addTarget(self, action: #selector(cellButtonClicked), for: .touchUpInside)
        
        return myCell!
    }
    
    func cellButtonClicked(_ sender : UIButton) {
        
        let player = playersArrayData?[sender.tag]
        
        print(player?.playerName)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

