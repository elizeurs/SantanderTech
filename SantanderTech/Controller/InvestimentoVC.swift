//
//  InvestimentoVC.swift
//  SantanderTech
//
//  Created by Elizeu RS on 06/06/19.
//  Copyright © 2019 elizeurs. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import SafariServices

class InvestimentoVC: UIViewController, SFSafariViewControllerDelegate {
  
  var infoList: [InfoModel] = []
  var downInfoList: [downInfoModel] = []
  
  
  @IBOutlet var monthFundLbl: UILabel!
  @IBOutlet var monthCDILbl: UILabel!
  @IBOutlet var yearFundLbl: UILabel!
  @IBOutlet var yearCDILbl: UILabel!
  @IBOutlet var twelveMonthsFundLbl: UILabel!
  @IBOutlet var twelveMonthsCDILbl: UILabel!
  
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    
    tableView.dataSource = self
    tableView.delegate = self
    
    getFunds()
    loadData()
 
  }

  
  func getFunds() {
    
    let url = "https://floating-mountain-50292.herokuapp.com/fund.json"
    
    Alamofire.request(url).responseObject { (response: DataResponse<FundModel>) in
      
      if response.result.isSuccess {
        
        let fundResponse = response.value
        
//        fundResponse?.risk = 4
//
//        switch fundResponse?.risk {
//        case 1: do {
//          self.seta1.isHidden = false
//          self.subView1.isHidden = false
//          self.view1.isHidden = false
//
//          self.seta2.isHidden = true
//          self.subView2.isHidden = true
//          self.view2.isHidden = true
//
//          self.seta3.isHidden = true
//          self.subView3.isHidden = true
//          self.view3.isHidden = true
//
//          self.seta4.isHidden = true
//          self.subView4.isHidden = true
//          self.view4.isHidden = true
//
//          self.seta5.isHidden = true
//          self.subView5.isHidden = true
//          self.view5.isHidden = true
//          break
//        }
//
//        case 2: do {
//          self.seta1.isHidden = true
//          self.subView1.isHidden = true
//          self.view1.isHidden = true
//
//          self.seta2.isHidden = false
//          self.subView2.isHidden = false
//          self.view2.isHidden = false
//
//          self.seta3.isHidden = true
//          self.subView3.isHidden = true
//          self.view3.isHidden = true
//
//          self.seta4.isHidden = true
//          self.subView4.isHidden = true
//          self.view4.isHidden = true
//
//          self.seta5.isHidden = true
//          self.subView5.isHidden = true
//          self.view5.isHidden = true
//          break
//          }
//
//        case 3: do {
//          self.seta1.isHidden = true
//          self.subView1.isHidden = true
//          self.view1.isHidden = true
//
//          self.seta2.isHidden = true
//          self.subView2.isHidden = true
//          self.view2.isHidden = true
//
//          self.seta3.isHidden = false
//          self.subView3.isHidden = false
//          self.view3.isHidden = false
//
//          self.seta4.isHidden = true
//          self.subView4.isHidden = true
//          self.view4.isHidden = true
//
//          self.seta5.isHidden = true
//          self.subView5.isHidden = true
//          self.view5.isHidden = true
//          break
//          }
//
//        case 4: do {
//          self.seta1.isHidden = true
//          self.subView1.isHidden = true
//          self.view1.isHidden = true
//
//          self.seta2.isHidden = true
//          self.subView2.isHidden = true
//          self.view2.isHidden = true
//
//          self.seta3.isHidden = true
//          self.subView3.isHidden = true
//          self.view3.isHidden = true
//
//          self.seta4.isHidden = false
//          self.subView4.isHidden = false
//          self.view4.isHidden = false
//
//          self.seta5.isHidden = true
//          self.subView5.isHidden = true
//          self.view5.isHidden = true
//          break
//          }
//
//        case 5: do {
//          self.seta1.isHidden = true
//          self.subView1.isHidden = true
//          self.view1.isHidden = true
//
//          self.seta2.isHidden = true
//          self.subView2.isHidden = true
//          self.view2.isHidden = true
//
//          self.seta3.isHidden = true
//          self.subView3.isHidden = true
//          self.view3.isHidden = true
//
//          self.seta4.isHidden = true
//          self.subView4.isHidden = true
//          self.view4.isHidden = true
//
//          self.seta5.isHidden = false
//          self.subView5.isHidden = false
//          self.view5.isHidden = false
//          break
//          }
//
//        default:
//          break
//      }
        
        self.monthFundLbl.text = "\(String(fundResponse?.monthFund ?? 0.0)) %"
        self.monthCDILbl.text = "\(String(fundResponse?.monthCDI ?? 0.0)) %"
        self.yearCDILbl.text = "\(String(fundResponse?.yearCDI ?? 0.0)) %"
        self.yearFundLbl.text = "\(String(fundResponse?.yearFund ?? 0.0)) %"
        self.twelveMonthsFundLbl.text = "\(String(fundResponse?.twelveMonthsFund ?? 0.0)) %"
        self.twelveMonthsCDILbl.text = "\(String(fundResponse?.twelveMonthsCDI ?? 0.0)) %"

        
        if let info = fundResponse?.info {
          
          self.infoList = info
          
        }
        
        if let downInfo = fundResponse?.downInfo {

          self.downInfoList = downInfo
          self.tableView.reloadData()
        }
      } else {
        //to do exibir comentario de erro
        
      }
    }
  }
  
  func loadData() {

    let url = "https://floating-mountain-50292.herokuapp.com/cells.json"

    Alamofire.request(url).responseObject { (response: DataResponse<CellModel>) in

      if response.result.isSuccess {

        let cellResponse = response.value
        if let cell = cellResponse?.cells{
          for item in cell {
            print(item.message ?? "")
          }
        }
      } else {
        //to do exibir comentario de erro
      }
    }
  }
  
  @IBAction func operURL(_ sender: Any) {
    
    // check if website exists
    guard let url = URL(string: "https://www.google.com/") else {
      return
    }
    
    let safariVC = SFSafariViewController(url: url)
    present(safariVC, animated: true, completion: nil)
  }
  
  func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
    controller.dismiss(animated: true, completion: nil)
  }
  

  
}


extension InvestimentoVC: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 30
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return infoList.count
        } else {
          return downInfoList.count
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
 
      if let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as? infoTableViewCell {
        let info = infoList[indexPath.row]
        
          cell.lblInfo.text = info.name
          cell.lblValor.text = info.data
              return cell
      } else {
        return UITableViewCell()
      }

    } else {
      
      if let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? downInfoTableViewCell {
        
        let info = downInfoList[indexPath.row]
        
        cell.lblDownInfo.text = info.name
        return cell
      } else {
        return UITableViewCell()
      }
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
}
