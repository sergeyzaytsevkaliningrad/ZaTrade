import Foundation

final class AddProductPresenter {
    var view: AddProductViewController?
    var isEditing: Bool = true
    var model = ProductModel(ProductName: "", ProductPrice: 0, ProductDescription: "", ProductTypeTax: false)
    
    
    
    func showModel() -> ProductModel {
        if !isEditing {
            model = ProductModel(ProductName: "", ProductPrice: 0, ProductDescription: "", ProductTypeTax: false)
        }
        
        return model
    }
    
    func checkTextfields() {
        if self.view?.descriptionProductTextField.text == "" || self.view?.nameTextField.text == "" || self.view?.priceTextField.text == "" {
            self.view?.addProduct.isEnabled = false
        } else {
            self.view?.addProduct.isEnabled = true
        }
    }
    
    func addProductFunc(name: String?, price: String?, descr: String?, typeTax: Bool) {
        self.model.ProductName = String(name!)
        self.model.ProductPrice = Double(price!)!
        self.model.ProductDescription = String(descr!)
        self.model.ProductTypeTax = typeTax
    }
    
    @objc func saveButtonAction() {
        self.view?.navigationController?.popViewController(animated: true)
        self.view?.dismiss(animated: true) {
            if self.isEditing {
                print("dismissed Edit view")
            } else {
                print("dismissed Add view")
            }
            
        }
    }
}
