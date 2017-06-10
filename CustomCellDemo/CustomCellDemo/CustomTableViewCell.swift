//
//  CustomTableViewCell.swift
//  CustomCellDemo
//
//  Created by Codekul on 11/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var playerImgView : UIImageView!
    @IBOutlet var playerNameLbl : UILabel!
    @IBOutlet var playerCountryLbl : UILabel!
    @IBOutlet var playerDescLbl : UILabel!
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
