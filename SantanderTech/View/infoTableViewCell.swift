//
//  infoTableViewCell.swift
//  SantanderTech
//
//  Created by Elizeu RS on 18/06/19.
//  Copyright © 2019 elizeurs. All rights reserved.
//

import UIKit

class infoTableViewCell: UITableViewCell {
  
  @IBOutlet var lblInfo: UILabel!
  @IBOutlet var lblValor: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
