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
        self.initializeCurrency()
        self.initializeCountry()
        self.initializeTax()
        self.initializeInformation()
    }
        
    private func initializeCurrency() {
        let currencies_data = self.entities_data["Currency"] as! [[String: Any]]
        
        for currency_data in currencies_data {
            let name = currency_data["name"] as! String
            let code = currency_data["code"] as! String
            let sign = currency_data["sign"] as! String
            
            var currency = EntityWrapper<Currency>.getByName(name)
            if (currency.isEmpty) {
                currency = EntityWrapper<Currency>.createNew()
            }
            
            currency.entity!.name = name
            currency.entity!.code = code
            currency.entity!.sign = sign
            currency.save()
        }
        
        print(EntityWrapper<Currency>.all())
    }

    private func initializeCountry() {
        let countries_data = self.entities_data["Country"] as! [[String: Any]]
        
        for country_data in countries_data {
            let name = country_data["name"] as! String
            let flag = country_data["flag"] as! String
            let currency = country_data["currency"] as! String
            
            var country = EntityWrapper<Country>.getByName(name)
            if (country.isEmpty) {
                country = EntityWrapper<Country>.createNew()
            }
            
            country.entity!.name = name
            country.entity!.flag = flag
            country.entity!.currency = EntityWrapper<Currency>.getByName(currency).entity
            country.save()
        }
        
        print(EntityWrapper<Country>.all())
    }
        
    private func initializeTax() {
        let taxes_data = self.entities_data["Tax"] as! [[String: Any]]
        
        for tax_data in taxes_data {
            let name = tax_data["name"] as! String
            let rate = tax_data["rate"] as! Int64
            let country = tax_data["country"] as! String
            
            var tax = EntityWrapper<Tax>.getByName(name)
            if (tax.isEmpty) {
                tax = EntityWrapper<Tax>.createNew()
            }
            
            tax.entity?.name = name
            tax.entity?.rate = rate
            tax.entity?.country = EntityWrapper<Country>.getByName(country).entity
            tax.save()
        }
        
        print(EntityWrapper<Tax>.all())
    }
    
    private func initializeInformation() {
        let informations_data = self.entities_data["Information"] as! [[String: Any]]
        
        for information_data in informations_data {
            let info = information_data["info"] as! String
            let tag = information_data["tag"] as! String
            let country = information_data["country"] as! String
            
            var information = EntityWrapper<Information>.getByField(field: "tag", value: tag)
            if (information.isEmpty) {
                information = EntityWrapper<Information>.createNew()
            }
            
            information.entity!.tag = tag
            information.entity!.info = info
            information.entity!.country = EntityWrapper<Country>.getByName(country).entity
            information.save()
        }
        
        print(EntityWrapper<Information>.all())
    }

}
