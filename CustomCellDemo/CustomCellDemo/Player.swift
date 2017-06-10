//
//  Player.swift
//  CustomCellDemo
//
//  Created by Codekul on 11/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation

class Player {
    
    var imagePath : String
    var playerName : String
    var playerCountry : String
    var playerDescription : String
    
    
    init(){
        self.imagePath = ""
        self.playerName = ""
        self.playerCountry = ""
        self.playerDescription = ""
    }
    
    init(_ imagePath : String, _ name:String, _ country:String, _ desc:String ){
        
        self.imagePath = imagePath
        self.playerName = name
        self.playerCountry = country
        self.playerDescription = desc
        
    }
    
    func getImagePath() -> String{
        return self.imagePath
    }
    
    
    
}
