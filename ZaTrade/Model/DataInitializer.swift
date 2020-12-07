import Foundation
import CoreData

class DataInitializer {
    var entities_data: [String: Any] = [:]
    
    init() {
        do {
            let path = Bundle.main.path(forResource: "Data", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            self.entities_data = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func initializeAll() {
     //   self.initializeCurrency()
     //   self.initializeCountry()
    //    self.initializeTax()
     //   self.initializeInformation()
    }
        
    private func initializeCurrency() {
        let currencies_data = self.entities_data["Currency"] as! [[String: Any]]
        
        for currency_data in currencies_data {
            let currency = EntityWrapper<Currency>.createNew()
            currency.entity!.name = currency_data["name"] as? String
            currency.entity!.code = currency_data["code"] as? String
            currency.entity!.sign = currency_data["sign"] as? String
            currency.save()
        }
        
        print(EntityWrapper<Currency>.all())
    }

    private func initializeCountry() {
        let countries_data = self.entities_data["Country"] as! [[String: Any]]
        
        for country_data in countries_data {
            let currency = country_data["currency"] as! String
            
            let country = EntityWrapper<Country>.createNew()
            country.entity!.name = country_data["name"] as? String
            country.entity!.flag = country_data["flag"] as? String
            country.entity!.currency = EntityWrapper<Currency>.getByName(name: currency).entity
            country.save()
            
        }
        
        print(EntityWrapper<Country>.all())
    }
        
    private func initializeTax() {
        print(EntityWrapper<Tax>.all())
    }
    
    private func initializeInformation() {
        print(EntityWrapper<Information>.all())
    }

}
