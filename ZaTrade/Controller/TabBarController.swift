import UIKit


class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        self.delegate = self
        
        let productListViewController = ProductListViewController()
        productListViewController.title = "Список товаров"
        productListViewController.tabBarItem = UITabBarItem(title: productListViewController.title, image: UIImage(systemName: "list.bullet.rectangle"), selectedImage: nil)
        self.navigationItem.title = productListViewController.title
        
        let calculatorViewController = TaxFreeCalculateController()
        calculatorViewController.title = "Вычисление TaxFree"
        calculatorViewController.tabBarItem = UITabBarItem(title: calculatorViewController.title, image: UIImage(systemName: "t.circle"), selectedImage: nil)
        
        let converterViewController = CameraViewController()
        converterViewController.title = "Конвертер валют"
        converterViewController.tabBarItem = UITabBarItem(title: converterViewController.title, image: UIImage(systemName: "arrow.2.circlepath.circle"), selectedImage: nil)
        
        let infoCountryViewController = InformationViewController()
        infoCountryViewController.title = "Информация"
        infoCountryViewController.tabBarItem = UITabBarItem(title: infoCountryViewController.title, image: UIImage(systemName: "info.circle"), selectedImage: nil)
      
        self.viewControllers = [productListViewController, calculatorViewController, converterViewController, infoCountryViewController]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.navigationItem.title = viewController.title
    }
    
}
