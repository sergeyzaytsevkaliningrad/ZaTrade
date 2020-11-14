import Foundation

class WelcomePresenter {
    weak var viewController: WelcomeViewController?
    
    @objc func openTabBarController() {
        let tabBarController = TabBarController()
        self.viewController!.navigationController?.pushViewController(tabBarController, animated: true)
    }
}
