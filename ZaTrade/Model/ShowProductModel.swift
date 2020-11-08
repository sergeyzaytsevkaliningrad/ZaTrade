//
//  ShowProductModel.swift
//  ZaTrade
//
//  Created by Анастасия  on 08.11.2020.
//

import Foundation

class ShowProductModel {
    
    var ProductName : String = ""
    var ProductPrice: Double
    var ProductDescription: String = ""
    
init(ProductName : String, ProductPrice: Double, ProductDescription: String ) {
    self.ProductName = ProductName
    self.ProductPrice = ProductPrice
    self.ProductDescription = ProductDescription
    }
    
}
