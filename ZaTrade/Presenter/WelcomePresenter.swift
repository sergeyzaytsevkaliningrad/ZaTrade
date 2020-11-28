import Foundation
import UIKit

class WelcomePresenter {
    weak var viewController: WelcomeViewController?
    let counties: [EntityWrapper<Country>]
    
    var currentCountryIndex: Int? {
        didSet {
            if currentCountryIndex != nil {
                self.viewController?.chooseCountry.countryFlag.text = counties[currentCountryIndex!].entity?.flag
                self.viewController?.chooseCountry.countryTitle.text = counties[currentCountryIndex!].entity?.name
            }
        }
    }
    
    init() {
        self.counties = EntityWrapper<Country>.all(sortKey: "name", ascending: true)
    }
    
    @objc func openTabBarController() {
        let tabBarController = TabBarController()
        self.viewController!.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    @objc func openCountryPickleView() {
        self.viewController?.showChooseCountryAlert()
    }
    
    @objc func openTaxFreeInformation() {
        let informationController = InfoCountryViewController()
        // TODO: add data to view controller
        self.viewController!.navigationController?.pushViewController(informationController, animated: true)
    }
    
}
