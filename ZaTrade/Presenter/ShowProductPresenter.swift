import Foundation

final class ShowProductPresenter {
    var view: ShowProductViewController?
    var model = ProductModel(
        ProductName: "",
        ProductPrice: 0,
        ProductDescription: "",
        ProductTypeTax: "",
        DateChanged: Date(),
        DateAdded: Date(),
        ProductContry: ""
    )
//    let products: [EntityWrapper<Product>]
    
    
    init() {
//        self.products = EntityWrapper<Product>.all()
//        print(products)
//        let product = EntityWrapper<Product>.getByName(self.model.ProductName)
//
//        self.model.ProductName = (product.entity?.name)!
//        self.model.ProductDescription = (product.entity?.extra)!
//        self.model.ProductPrice! = product.entity!.price
//        self.model.DateAdded = (product.entity?.date_added)!
//        self.model.DateChanged = (product.entity?.date_changed)!
//        self.model.ProductTypeTax = product.entity?.tax
//        self.model.ProductContry = product.entity?.country
    }
    
    @objc func showEdit() {
        let vc = AddProductViewController(isEditingView: true)
        self.view!.navigationController?.pushViewController(vc, animated: true)
        vc.presenter.model = self.model
    }
    
    @objc func delete() {
        let product = EntityWrapper<Product>.getByName(self.model.ProductName)
        product.delete()
    }
    
}
