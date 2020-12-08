import Foundation


class AddProductMenuPresenter {
    weak var viewController: AddProductMenuViewController?
    
    @objc func addUsingCamera() {
        viewController?.dismiss(animated: false, completion: nil)
        print("addUsingCamera")
    }
    
    @objc func addUsingInput() {
        viewController?.dismiss(animated: false, completion: nil)
        let vc = AddProductViewController(isEditingView: false)
        viewController?.mainNavigationController?.pushViewController(vc, animated: true)
    }
    
}
