import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        self.delegate = self
        
        let productListViewController = ProductListViewController()
        productListViewController.title = "Список товаров"
        productListViewController.tabBarItem = UITabBarItem(title: productListViewController.title, image: nil, selectedImage: nil)
        self.navigationItem.title = productListViewController.title
        
        let calculatorViewController = CalculatorViewController()
        calculatorViewController.title = "Калькулятор"
        calculatorViewController.tabBarItem = UITabBarItem(title: calculatorViewController.title, image: nil, selectedImage: nil)
        
        let converterViewController = ConverterViewController()
        converterViewController.title = "Конвертер валют"
        converterViewController.tabBarItem = UITabBarItem(title: converterViewController.title, image: nil, selectedImage: nil)
        
        let infoCountryViewController = InfoCountryViewController()
        infoCountryViewController.title = "Информация"
        infoCountryViewController.tabBarItem = UITabBarItem(title: infoCountryViewController.title, image: nil, selectedImage: nil)
        
        self.viewControllers = [productListViewController, calculatorViewController, converterViewController, infoCountryViewController, BaseViewController()]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.navigationItem.title = viewController.title
    }
    
}
