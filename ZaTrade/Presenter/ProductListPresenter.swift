import Foundation


class ProductListPresenter {
    weak var viewController: ProductListViewController?
    
    var products: [EntityWrapper<Product>] = []
        
    func reloadData() {
        products = EntityWrapper<Product>.all(sortKey: "name", ascending: false)
        DispatchQueue.main.async {
            self.viewController?.collectionView.reloadData()
        }
    }
    
    @objc func showPopover() {
        let vc = AddProductMenuViewController()
        vc.mainNavigationController = viewController?.navigationController
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = .init(width: 120, height: 60)
        
        let popover = vc.popoverPresentationController!
        popover.sourceView = viewController!.buttonPlus
        popover.sourceRect = viewController!.buttonPlus.bounds
        popover.permittedArrowDirections = [.down]
        popover.delegate = viewController!
        
        viewController?.present(vc, animated: true)
    }
    
    func showProduct(_ index: Int) {
        let vc = ShowProductViewController()
        vc.presenter.product = products[index]
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
}


