//
//  DetailCell.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/6/21.
//  Copyright © 2018年 Richard Han. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
