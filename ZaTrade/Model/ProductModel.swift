import Foundation


class ProductModel {
    
    var ProductName : String
    var ProductPrice: Double?
    var ProductDescription: String
    var ProductTypeTax: String?
    var ProductContry: String?
    var DateChanged: Date
    var DateAdded: Date
    
init(ProductName : String, ProductPrice: Double, ProductDescription: String, ProductTypeTax: String, DateChanged: Date, DateAdded: Date, ProductContry: String) {
    self.ProductName = ProductName
    self.ProductPrice = ProductPrice
    self.ProductDescription = ProductDescription
    self.ProductTypeTax = ProductTypeTax
    self.DateChanged = DateChanged
    self.DateAdded = DateAdded
    self.ProductContry = ProductContry
    }
    
}
