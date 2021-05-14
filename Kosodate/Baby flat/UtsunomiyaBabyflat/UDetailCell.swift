//
//  UDetailCell.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/12/05.
//  Copyright © 2018 Richard Han. All rights reserved.
//
import UIKit

class UDetailCell: UITableViewCell {
    
    
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
