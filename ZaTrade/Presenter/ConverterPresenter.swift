import UIKit
import Foundation

final class ConverterPresenter {
    
    weak var view: ConverterViewController?
    private var courses: [Course] = []
    let currencies: [EntityWrapper<Currency>]
    
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
                let from = currencies[currentCurrencyIndex!].entity?.code
                let to = currencies[convertCurrencyIndex!].entity?.code
                view?.resultLabel.text = " \((CourseLoader.shared.convert(from: from!, to: to!, price: Double(view!.input!)!)))"
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
        self.courses = CourseLoader.shared.courses
    }
    
    
}

extension Double {
    var convertToTwo: Double {(self * 100).rounded() / 100}
}
