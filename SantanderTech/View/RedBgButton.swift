//
//  roundBtn.swift
//  SantanderTech
//
//  Created by Elizeu RS on 07/06/19.
//  Copyright © 2019 elizeurs. All rights reserved.
//

import UIKit

class RedBgButton: UIButton {
  override func awakeFromNib() {
    layer.backgroundColor = RED_BG
    layer.cornerRadius = layer.frame.height / 2
    setTitleColor(UIColor.white, for: .normal)
  }
}
