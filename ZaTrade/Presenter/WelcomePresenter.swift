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
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let countryCode = LocationManageR.shared.country
            print(countryCode)
            let country = EntityWrapper<Country>.getByField(field: "code", value: countryCode)
            if !country.isEmpty {
                for index in 0..<self.counties.count {
                    if self.counties[index].entity == country.entity {
                        self.currentCountryIndex = index
                    }
                }
            }
        }
        
    }
    
    @objc func openTabBarController() {
        if currentCountryIndex != nil {
            let tabBarController = TabBarController()
            self.viewController!.navigationController?.pushViewController(tabBarController, animated: true)
        }
    }
    
    @objc func openCountryPickleView() {
        self.viewController?.showChooseCountryAlert()
    }
    
    @objc func openTaxFreeInformation() {
        let informationController = InformationViewController()
        // TODO: add data to view controller (set current article)
        self.viewController!.navigationController?.pushViewController(informationController, animated: true)
    }
    
}
