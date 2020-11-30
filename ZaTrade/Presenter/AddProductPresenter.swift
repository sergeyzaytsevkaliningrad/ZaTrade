import Foundation

final class AddProductPresenter {
    var view: AddProductViewController?
    var isEditing: Bool = false
    private var model = ProductModel(ProductName: "", ProductPrice: 0, ProductDescription: "", ProductTypeTax: false)

   
    
    func showModel() -> ProductModel {
        if isEditing {
            model = ProductModel(ProductName: "MacBook Pro 13'", ProductPrice: 120000, ProductDescription: "bjrhirehriehirihribe", ProductTypeTax: false)
        }
        
        return model
    }
    func addProductFunc(name: String?, price: String?, descr: String?, typeTax: Bool) {
        if let nametf = name {
            if nametf != "" {
                self.model.ProductName = String(nametf)
            } else {
                self.view?.makeRedNameText()
            }
        }
        if let pricetf = price {
            if pricetf != "" {
                self.model.ProductPrice = Double(pricetf)!
            } else {
                self.view?.makeRedPriceText()
            }
        }
        if let descrtf = descr {
            if descrtf != "" {
                self.model.ProductDescription = String(descrtf)
            } else {
                self.view?.makeRedDescriptionProductText()
            }
        }
        self.model.ProductTypeTax = typeTax
    }
}
