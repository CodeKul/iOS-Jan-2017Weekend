//
//  Players.swift
//  customTableView
//
//  Created by Varun on 18/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation

class Players{
    
    var fName : String
    var lName : String
    var imageUrl : String
    
    init(_ fName:String, _ lName : String, _ imageUrl : String){
        self.fName = fName
        self.lName = lName
        self.imageUrl = imageUrl
    }
}
