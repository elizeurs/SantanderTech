//
//  SentMsgVC.swift
//  SantanderTech
//
//  Created by Elizeu RS on 24/06/19.
//  Copyright © 2019 elizeurs. All rights reserved.
//
import Foundation
import UIKit

class SentMsgVCV: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
  @IBAction func sendNewMsgTapped(_ sender: Any) {
    
    _ = navigationController?.popViewController(animated: true)
  }
  
}
