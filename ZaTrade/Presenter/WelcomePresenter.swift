import Foundation

class WelcomePresenter {
    weak var viewController: WelcomeViewController?
    
    @objc func openProductTable() {
        let destination = ItemTable()
        self.viewController?.navigationController!.pushViewController(destination, animated: true)
    }
}
