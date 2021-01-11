import UIKit

final class TaxFreeCalculatePresenter {
    
    weak var view: TaxFreeCalculateController?
    let taxes: [EntityWrapper<Tax>]
    var countries: [Country] = []
    var currentTaxes: [Tax] = []
    var currency: String = "RUB"
    var courses: [Course] = []
    
    private var formatter: NumberFormatter {
        let result = NumberFormatter()
        result.numberStyle = .currency
        result.locale = Locale(identifier: "ru_RU")
        return result
    }
    
    var currentCountryIndex: Int? = 0 {
        didSet {
            self.view?.chooseItem.title = countries[currentCountryIndex!].flag
            self.view?.topCurrencyLabel.text = countries[currentCountryIndex!].currency?.sign
            self.loadTaxes()
            self.view?.taxType.reloadAllComponents()
            self.currentTaxIndex = 0
        }
    }
    
    var currentTaxIndex: Int? = 0
    
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
        self.currentTaxes.removeAll()
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
            let currentCurrency = currentTaxes[currentTaxIndex!].country!.currency!.code!
            let resultRUB = CourseLoader.shared.convertToRub(currency: currentCurrency, price: resultUSD)
            let taxCount = (text / (100 + tax) * tax).convertToTwo
            
            let formatter = self.formatter
            formatter.currencySymbol = EntityWrapper<Currency>.getByName("RUB").entity!.sign!
            self.view?.resultRUB.text = "Цена в рублях: \(formatter.string(from: NSNumber(value: resultRUB))!)"
            
            formatter.currencySymbol = EntityWrapper<Currency>.getByName(currentCurrency).entity!.sign!
            self.view?.taxCount.text = "Размер налога: \(formatter.string(from: NSNumber(value: taxCount))!)"
            self.view?.resultUSD.text = "Цена в валюте: \(formatter.string(from: NSNumber(value: resultUSD))!)"
        }        
    }
    
    func loadCourses()  {
        self.courses = CourseLoader.shared.courses
    }
   
    
}


