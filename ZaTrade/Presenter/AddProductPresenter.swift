//
//  AddProductPresenter.swift
//  ZaTrade
//
//  Created by Анастасия  on 07.11.2020.
//

import Foundation

final class AddProductPresenter {
    var view: AddProductViewController?
    let model = AddProductModel (ProductName: "", ProductPrice: 0, ProductDescription: "", ProductTypeTax: false)

    func addProductFunc(name: String?, price: String?, descr: String?, typeTax: Bool) {
        if let nametf = name {
            self.model.ProductName = String(nametf)
        }
        if let pricetf = price {
            self.model.ProductPrice = Double(pricetf)!
        }
        if let descrtf = descr {
            self.model.ProductDescription = String(descrtf)
        }
        self.model.ProductTypeTax = typeTax
    }
}
