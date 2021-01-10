import UIKit

final class TaxFreeCalculatePresenter {
    
    weak var view: TaxFreeCalculateController?
    let taxes: [EntityWrapper<Tax>]
    var countries: [Country] = []
    var currentTaxes: [Tax] = []
    var currency: String = "RUB"
    var courses: [Course] = []
    
    var currentCountryIndex: Int? = 0 {
        didSet {
            self.view?.chooseItem.title = countries[currentCountryIndex!].flag
            self.view?.topCurrencyLabel.text = countries[currentCountryIndex!].currency?.sign
            self.loadTaxes()
            self.view?.taxType.reloadAllComponents()
        }
    }
    
    var currentTaxIndex: Int?
    
    init() {
        self.taxes = EntityWrapper<Tax>.all(sortKey: "name", ascending: true)
        for tax in taxes {
            let country = tax.entity?.country
            if !countries.contains(country!) {
                countries.append(country!)
            }
        }
        self.loadTaxes()
        self.loadCourses()
    }
    
    private func loadTaxes()  {
        self.currentTaxes = []
        for tax in taxes {
            if tax.entity?.country == countries[currentCountryIndex!] {
                self.currentTaxes.append(tax.entity!)
            }
        }
        print(self.currentTaxes)
    }
    
    @objc func count() {
        if currentTaxIndex != nil && self.view?.textField.text != nil {
            let text = Double(self.view?.textField.text ?? "0")!
            let tax = Double(taxes[currentTaxIndex!].entity?.rate ?? 0)
            let resultUSD = (text / (100 + tax) * 100).convertToTwo
            let currency = taxes[currentTaxIndex!].entity?.country?.currency?.code
            let resultRUB = CourseLoader.shared.convertToRub(currency: currency!, price: resultUSD)
            let taxCount = (text / (100 + tax) * tax).convertToTwo
            
            self.view?.taxCount.text = "Размер налога: \(taxCount)"
            self.view?.resultRUB.text = "Цена в рублях: \(resultRUB)"
            self.view?.resultUSD.text = "Цена в валюте: \(resultUSD)"
        }        
    }
    
    func loadCourses()  {
        self.courses = CourseLoader.shared.courses
    }
   
    
}


