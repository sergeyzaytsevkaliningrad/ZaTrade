import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        self.delegate = self
        
        let productListViewController = ProductListViewController()
        productListViewController.title = "Список товаров"
        productListViewController.tabBarItem = UITabBarItem(title: productListViewController.title, image: nil, tag: 0)
        self.navigationItem.title = productListViewController.title
        
        let calculatorViewController = CalculatorViewController()
        calculatorViewController.title = "Калькулятор"
        calculatorViewController.tabBarItem = UITabBarItem(title: calculatorViewController.title, image: nil, tag: 1)
        
        let converterViewController = ConverterViewController()
        converterViewController.title = "Конвертер валют"
        converterViewController.tabBarItem = UITabBarItem(title: converterViewController.title, image: nil, tag: 2)
        
        let infoCountryViewController = InfoCountryViewController()
        infoCountryViewController.title = "Информация"
        infoCountryViewController.tabBarItem = UITabBarItem(title: infoCountryViewController.title, image: nil, tag: 3)
        
        self.viewControllers = [productListViewController, calculatorViewController, converterViewController, infoCountryViewController]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.navigationItem.title = viewController.title
    }
    
}
