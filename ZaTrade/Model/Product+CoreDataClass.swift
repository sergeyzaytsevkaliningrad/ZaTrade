import Foundation
import CoreData

@objc(Product)
public class Product: NSManagedObject {
    
    private var formatter: NumberFormatter {
        let result = NumberFormatter()
        result.numberStyle = .currency
        result.locale = Locale(identifier: "ru_RU")
        return result
    }
    
    var formattedPrice: String {
        let formatter = self.formatter
        formatter.currencySymbol = self.country?.currency?.sign!
        return formatter.string(from: NSNumber(value: self.price))!
    }
    
    var formattedRubPrice: String {
        let formatter = self.formatter
        let price = self.price // TODO: перевод в рубли
        return formatter.string(from: NSNumber(value: price))!
    }
    
}
