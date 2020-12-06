import Foundation

class ProductListPresenter {
    weak var controller: ProductListViewController?
    
    var products: [EntityWrapper<Product>]
    
    init() {
        products = EntityWrapper<Product>.all(sortKey: "name", ascending: false)
    }
    
    @objc func showPopover() {
        let vc = AddProductMenuViewController()
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = .init(width: 120, height: 60)
        
        let popover = vc.popoverPresentationController!
        popover.sourceView = controller!.buttonPlus
        popover.sourceRect = controller!.buttonPlus.bounds
        popover.permittedArrowDirections = [.down]
        popover.delegate = controller!
        
        controller?.present(vc, animated: true)
    }
    
}


