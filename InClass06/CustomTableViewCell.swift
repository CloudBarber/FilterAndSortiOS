//
//  CustomTableViewCell.swift
//  InClass06
//
//  Created by Evans, Jonathan on 4/28/19.
//  Copyright © 2019 Evans, Jonathan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var NameLabel: UILabel!
    
    
    @IBOutlet weak var StateLabel: UILabel!
    
    
    @IBOutlet weak var AgeLabel: UILabel!
    

    @IBOutlet weak var GroupLabel: UILabel!
    
    
    @IBOutlet weak var ImageViewOutlet: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
