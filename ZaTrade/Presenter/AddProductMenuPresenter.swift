import Foundation


class AddProductMenuPresenter {
    weak var controller: AddProductMenuViewController?
    
    @objc func addUsingCamera() {
        print("addUsingCamera")
        controller?.dismiss(animated: true, completion: nil)
    }
    
    @objc func addUsingInput() {
        print("addUsingInput")
        controller?.dismiss(animated: true, completion: nil)
    }
    
}
