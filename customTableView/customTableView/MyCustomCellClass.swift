//
//  MyCustomCellClass.swift
//  customTableView
//
//  Created by Varun on 18/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class MyCustomCellClass: UITableViewCell {

    
    @IBOutlet var fName : UILabel!
    @IBOutlet var lName : UILabel!
    @IBOutlet var userImage : UIImageView!
    @IBOutlet var imageButton : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
