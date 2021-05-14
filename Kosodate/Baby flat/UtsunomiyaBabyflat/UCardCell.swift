//
//  UCardCell.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/12/05.
//  Copyright © 2018 Richard Han. All rights reserved.
//

import UIKit

class UCardCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var LocaLabel: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var favorite = false {
        willSet {
            if newValue {
                favBtn.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
                
            }
            else {
                favBtn.setImage(#imageLiteral(resourceName: "unfav"), for: .normal)
            }
        }
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

