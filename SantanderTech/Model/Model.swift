////
////  Model.swift
////  SantanderTech
////
////  Created by Elizeu RS on 10/06/19.
////  Copyright © 2019 elizeurs. All rights reserved.
////
//

import Foundation
import ObjectMapper

class FundModel: Mappable {
  var title: String?
  var fundName: String?
  var whatIs: String?
  var definition: String?
  var riskTitle: String?
  var risk: Int?
  var infoTitle: String?
  
  var monthFund: Double?
  var monthCDI: Double?
  
  var yearFund: Double?
  var yearCDI: Double?
  
  var twelveMonthsFund: Double?
  var twelveMonthsCDI: Double?
  
  var info: [InfoModel]?
  var downInfo: [downInfoModel]?
  
  required init?(map: Map){
    
  }
  
  func mapping(map: Map) {
    title <- map["screen.title"]
    fundName <- map["screen.fundName"]
    whatIs <- map["screen.whatIs"]
    definition <- map["screen.definition"]
    riskTitle <- map["screen.riskTitle"]
    risk <- map["screen.risk"]
    infoTitle <- map["screen.infoTitle"]
    
    monthFund <- map["screen.moreInfo.month.fund"]
    monthCDI <- map["screen.moreInfo.month.CDI"]
    
    yearFund <- map["screen.moreInfo.year.fund"]
    yearCDI <- map["screen.moreInfo.year.CDI"]
    
    twelveMonthsFund <- map["screen.moreInfo.12months.fund"]
    twelveMonthsCDI <- map["screen.moreInfo.12months.CDI"]
    
    info <- map["screen.info"]
    downInfo <- map["screen.downInfo"]
  }
}

class InfoModel: Mappable {
  var name: String?
  var data: String?
  
  required init?(map: Map){
    
  }
  
  func mapping(map: Map) {
    name <- map["name"]
    data <- map["data"]
  }
}

class downInfoModel: Mappable {
  var name: String?
  var data: String?
  
  required init?(map: Map){
    
  }
  
  func mapping(map: Map) {
    name <- map["name"]
    data <- map["data"]
  }
}

class CellModel: Mappable {
  
  var cells: [Cell2Model]?
  
  
  required init?(map: Map){
    
  }
  
  func mapping(map: Map) {
    
    cells <- map["cells"]
  }
}

class Cell2Model: Mappable {
  
  var id: Int?
  var type: Int?
  var message: String?
  var typefield: Any?
  var hidden: Bool?
  var topSpacing: Int?
  var show: Any?
  var required: Bool?
  
  required init?(map: Map){
    
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    type <- map["type"]
    message <- map["message"]
    typefield <- map["typefield"]
    hidden <- map["hidden"]
    topSpacing <- map["topSpacing"]
    show <- map["show"]
    required <- map["required"]
  }
}
