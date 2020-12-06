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
