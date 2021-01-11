import Foundation
import CoreData

@objc(Product)
public class Product: NSManagedObject {
    
    var formatter: NumberFormatter {
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
        let price = CourseLoader.shared.convertToRub(currency: self.country!.currency!.code!, price: self.price)
        return formatter.string(from: NSNumber(value: price))!
    }
    
    var countryWithFlag: String {
        return "\(self.country!.name!) \(self.country!.flag!)"
    }
        
}
