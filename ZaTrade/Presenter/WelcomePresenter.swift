import Foundation

class WelcomePresenter {
    weak var viewController: WelcomeViewController?
    
    @objc func openProductTable() {
        let destination = ItemTable()
        self.viewController?.navigationController?.setNavigationBarHidden(false, animated: true)
        self.viewController?.navigationController!.pushViewController(destination, animated: true)
    }
}
