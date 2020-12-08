import UIKit

final class TaxFreeCalculatePresenter {
    
    weak var view: TaxFreeCalculateController?
    let taxes: [EntityWrapper<Tax>]
    let loader = CourseLoader()
    var currency: String = "RUB"
    var courses: [Course] = []
    var currentTaxIndex: Int? {
        didSet {
            self.view?.topCurrencyLabel.text = taxes[currentTaxIndex!].entity?.country?.currency?.sign
        }
    }
    
    init() {
        self.taxes = EntityWrapper<Tax>.all(sortKey: "name", ascending: true)
        self.loadCourses()
    }
    
    @objc func count() {
        if currentTaxIndex != nil && self.view?.textField.text != nil {
            let text = Double(self.view?.textField.text ?? "0") ?? 0
            let course = calculateCourse()
            let tax = Double(taxes[currentTaxIndex!].entity?.rate ?? 0)
            let resultUSD = (text / (100 + tax) * 100 * 100).rounded() / 100
            let resultRUB = (resultUSD / course * 100).rounded() / 100
            let taxCount = (text / (100 + tax) * tax * 100).rounded() / 100
            
            self.view?.taxCount.text = "Размер налога: \(taxCount)"
            self.view?.resultRUB.text = "Цена в рублях: \(resultRUB)"
            self.view?.resultUSD.text = "Цена в валюте: \(resultUSD)"
        }        
    }
    
    func loadCourses()  {
        loader.loadArray(completionBlock: {data in 
            self.courses.removeAll()
            for element in data {
                self.courses.append(element)
            }
        })
    }
    
    func findValue(name: String) -> Double  {
        var result: Double = 0
        for element in courses {
            if element.key == name {
                result = element.value
            }
        }
        return result
    }
    
    func calculateCourse() -> Double {
        let curr = "RUB"
        let conv = taxes[currentTaxIndex!].entity?.country?.currency?.code
        
        let first = findValue(name: curr)
        let second = findValue(name: conv!)
        
        let result = second / first
        return result
    }
    
    func convertToTwo(_ n: Double) -> Double { Double(round(n * 100) / 100) }
    
    
}


