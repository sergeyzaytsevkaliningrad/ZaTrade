import Foundation


class AddProductMenuPresenter {
    weak var viewController: AddProductMenuViewController?
    
    @objc func addUsingCamera() {
        viewController?.dismiss(animated: false, completion: nil)
        let vc = CameraViewController()
        viewController?.mainNavigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func addUsingInput() {
        viewController?.dismiss(animated: false, completion: nil)
        let vc = AddProductViewController(isEditingView: false)
        viewController?.mainNavigationController?.pushViewController(vc, animated: true)
    }
    
}
