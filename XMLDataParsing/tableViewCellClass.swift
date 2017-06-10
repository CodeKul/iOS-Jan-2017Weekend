//
//  tableViewCellClass.swift
//  XMLDataParsing
//
//  Created by Codekul on 28/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class tableViewCellClass: UITableViewCell {
    
    
    @IBOutlet var Name : UILabel?
    @IBOutlet var Price : UILabel?
    @IBOutlet var Description : UILabel?
    @IBOutlet var Calories : UILabel?
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
