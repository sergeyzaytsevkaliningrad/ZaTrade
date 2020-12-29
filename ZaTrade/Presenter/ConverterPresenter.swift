import UIKit
import Foundation

final class ConverterPresenter {
    
    weak var view: ConverterViewController?
    private var courses: [Course] = []
    let currencies: [EntityWrapper<Currency>]
    let courseLoader = CourseLoader()
    
    var currentCurrencyIndex: Int? {
        didSet {
            if currentCurrencyIndex != nil {
                self.view?.currentButton.setTitle(currencies[currentCurrencyIndex!].entity?.code, for: .normal)
                convert()
            }
        }
    }
    
    var convertCurrencyIndex: Int? {
        didSet {
            if convertCurrencyIndex != nil {
                self.view?.toButton.setTitle(currencies[convertCurrencyIndex!].entity?.code, for: .normal)
                convert()
            }
        }
    }
    
    init() {
        self.currencies = EntityWrapper<Currency>.all(sortKey: "name", ascending: true)
        self.loadCourses()
    }
    
    func convert() {
        if self.convertCurrencyIndex != nil && self.currentCurrencyIndex != nil && self.view?.input != nil {
            if view?.input == "" {
                view?.resultLabel.text = ""
            } else {
                let course = calculateCourse()
                let input = Double(view!.input!) ?? 0
                let result = input * course
                view?.resultLabel.text = " \(convertToTwo(result))"
            }
        }
    }
    
    func swap(sender: SwapButton) {
        if convertCurrencyIndex != nil && currentCurrencyIndex != nil{
            let first = currentCurrencyIndex
            currentCurrencyIndex = convertCurrencyIndex
            convertCurrencyIndex = first
            self.view?.toPicker.selectRow(convertCurrencyIndex!, inComponent: 0, animated: true)
            self.view?.curentPicker.selectRow(currentCurrencyIndex!, inComponent: 0, animated: true)
        }
    }
    
    func loadCourses()  {
        courseLoader.loadArray(completionBlock: {data in 
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
        let curr = currencies[currentCurrencyIndex!].entity?.code
        let conv = currencies[convertCurrencyIndex!].entity?.code
        
        let first = findValue(name: curr!)
        let second = findValue(name: conv!)
        
        let result = second / first
        return result
    }
    
    func convertToTwo(_ n: Double) -> Double { Double(round(n * 100) / 100) }
    
    
}
