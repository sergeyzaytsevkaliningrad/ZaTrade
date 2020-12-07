import Foundation

final class AddProductPresenter {
    var view: AddProductViewController?
    var isEditing: Bool = true
    var model = ProductModel(
        ProductName: "",
        ProductPrice: 0,
        ProductDescription: "",
        ProductTypeTax: "",
        DateChanged: Date(),
        DateAdded: Date(),
        ProductContry: ""
    )

    func showModel() -> ProductModel {
        if !isEditing {
            model = ProductModel(
                ProductName: "",
                ProductPrice: 0,
                ProductDescription: "",
                ProductTypeTax: "",
                DateChanged: Date(),
                DateAdded: Date(),
                ProductContry: ""
            )
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

    @objc func saveButtonAction() {
        self.view?.navigationController?.popViewController(animated: true)
        self.view?.dismiss(animated: true) {
            if self.isEditing {
                let product = EntityWrapper<Product>.getByName(self.model.ProductName)
                product.entity?.name = self.showModel().ProductName
                product.entity?.extra = self.showModel().ProductDescription
                product.entity?.price = self.showModel().ProductPrice!
                product.entity?.date_changed = Date()
                product.save()
                print("dismissed Edit view")
            } else {
                let product = EntityWrapper<Product>.createNew()
                product.entity?.extra = self.showModel().ProductDescription
                product.entity?.name = self.showModel().ProductName
                product.entity?.price = self.showModel().ProductPrice!
                product.entity?.date_added = Date()
                product.entity?.date_changed = Date()
                product.save()
                print("dismissed Add view")
            }
            
        }
    }
}
