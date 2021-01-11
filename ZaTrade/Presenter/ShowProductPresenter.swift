import Foundation
import CoreData


final class ShowProductPresenter {
    var viewController: ShowProductViewController?
    var product: EntityWrapper<Product>?
     
    @objc func showEdit() {
        let vc = AddProductViewController(isEditingView: true)
        vc.presenter.product = product
        self.viewController!.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func delete() {
        product!.delete()
        viewController?.navigationController?.popViewController(animated: true)
    }
}
