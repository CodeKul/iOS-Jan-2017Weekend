//
//  tableViewCellClass.swift
//  userDefaultsPractice
//
//  Created by Aditya Goyal on 13/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class tableViewCellClass: UITableViewCell {
    
    
    @IBOutlet var name : UILabel!
    @IBOutlet var rollNo : UILabel!
    @IBOutlet var marks : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
