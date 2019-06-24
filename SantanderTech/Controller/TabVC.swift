//
//  TabVC.swift
//  SantanderTech
//
//  Created by Elizeu RS on 21/06/19.
//  Copyright © 2019 elizeurs. All rights reserved.
//

import UIKit

class TabVC: UITabBarController {
  
  var customTabBarItem = UITabBarItem()

    override func viewDidLoad() {
        super.viewDidLoad()
      
      tabBar.isTranslucent = false
      
      UITabBar.appearance().barTintColor = UIColor(red: 238/255, green: 0/255, blue: 0/255, alpha: 1)
      
      UITabBar.appearance().tintColor = UIColor(white: 1, alpha: 1)
      tabBar.unselectedItemTintColor = UIColor(white: 1, alpha: 1)
      
      let systemFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0)]
      UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributes, for: .normal)

      let numberOfTabs = CGFloat((tabBar.items?.count)!)
      let tabBarSize = CGSize(width: tabBar.frame.width / numberOfTabs, height: tabBar.frame.height + 30)
      tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: #colorLiteral(red: 0.8156862745, green: 0, blue: 0, alpha: 1), size: tabBarSize)
      
      self.selectedIndex = 0
      
      
      //      UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
      //      UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.yellow], for: .normal)
      
      
      

//
//      UITabBar.appearance().barTintColor = UIColor(red: 218/255, green: 1/255, blue: 1/255, alpha: 1)
//      UITabBar.appearance().backgroundColor = UIColor(red: 50/255, green: 1/255, blue: 1/255, alpha: 1)
//      UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: [])
      
      
    }

}

extension UIImage {
  class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
  }
}
