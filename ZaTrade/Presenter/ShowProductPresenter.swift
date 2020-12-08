import Foundation

final class ShowProductPresenter {
    var view: ShowProductViewController?
    var model = ProductModel(ProductName: "", ProductPrice: 0, ProductDescription: "", ProductTypeTax: "", DateChanged: Date(), DateAdded: Date(), ProductContry: "")
    
    var name: String = ""
    
    func loadData() {
        let product = EntityWrapper<Product>.getByName(self.name)
        let model = ProductModel (ProductName: product.entity?.name ?? "", ProductPrice: product.entity?.price ?? 0, ProductDescription: product.entity?.extra ?? "", ProductTypeTax: "", DateChanged: product.entity?.date_changed ?? Date(), DateAdded: product.entity?.date_added ?? Date(), ProductContry: "")
        self.model = model
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
