//
//  AddProductModel.swift
//  ZaTrade
//
//  Created by Анастасия  on 07.11.2020.
//

import Foundation


class AddProductModel {
    
    var ProductName : String = ""
    var ProductPrice: Double
    var ProductDescription: String = ""
    var ProductTypeTax: Bool
    
init(ProductName : String, ProductPrice: Double, ProductDescription: String, ProductTypeTax: Bool  ) {
    self.ProductName = ProductName
    self.ProductPrice = ProductPrice
    self.ProductDescription = ProductDescription
    self.ProductTypeTax = ProductTypeTax
    }
    
}
