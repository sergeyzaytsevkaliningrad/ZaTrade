import Foundation

final class AddProductPresenter {
    var view: AddProductViewController?
    var isEditing: Bool = true
    var product: EntityWrapper<Product>?
    var countries: [EntityWrapper<Country>] = []
    var tax: [EntityWrapper<Tax>] = []
    var selectedCountry: String
    var selectedTax: String
    var foundTax: [EntityWrapper<Tax>] = []
    
    var currentCountryIndex: Int? {
        didSet {
            if currentCountryIndex != nil {
                self.view?.chooseCountry.countryFlag.text = countries[currentCountryIndex!].entity?.flag
                self.view?.chooseCountry.countryTitle.text = countries[currentCountryIndex!].entity?.name
                
            }
        }
    }
    
    var currentTaxIndex: Int? {
        didSet {
            if currentTaxIndex != nil {
                self.view?.typeTax.countryFlag.text = foundTax[currentTaxIndex!].entity?.country?.flag
                self.view?.typeTax.countryTitle.text = foundTax[currentTaxIndex!].entity?.name
            }
        }
    }
    
    init() {
        self.countries = EntityWrapper<Country>.all(sortKey: "name", ascending: true)
        self.tax = EntityWrapper<Tax>.all(sortKey:"name", ascending: true)
        self.selectedCountry = ""
        self.selectedTax = ""
    }
    
    func loadTax() {
        if self.selectedCountry != "" {
            self.foundTax.removeAll()
            for i in self.tax {
                if i.entity?.country?.code == self.selectedCountry
                {
                    self.foundTax.append(i)
                }
            }
        }
    }

    
    func checkTextfields() {
        if self.view?.descriptionProductTextField.text == "" || self.view?.nameTextField.text == "" || self.view?.priceTextField.text == "" || self.selectedTax == "" || self.selectedTax == "" {
            self.view?.addProduct.isEnabled = false
        } else {
            self.view?.addProduct.isEnabled = true
        }
    }
 
    @objc func saveButtonAction() {
        let ProductName = self.view!.nameTextField.text
        let ProductDescription = self.view!.descriptionProductTextField.text
        let ProductPrice = Double((self.view!.priceTextField.text!))!
        let ProductCountry = self.countries[self.currentCountryIndex!].entity!.name
        let ProductTax = self.foundTax[self.currentTaxIndex!].entity!.name
        
        if !self.isEditing {
            product = EntityWrapper<Product>.createNew()
            product!.entity?.date_added = Date()
        }
        
        product!.entity?.name = ProductName
        product!.entity?.extra = ProductDescription
        product!.entity?.price = ProductPrice
        product!.entity?.date_changed = Date()
        product!.entity?.country = EntityWrapper<Country>.getByField(field: "name", value: ProductCountry!).entity
        product!.entity?.tax = EntityWrapper<Tax>.getByField(field: "name", value: ProductTax!).entity
        product!.save()

        self.view?.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func openCountryPickleView() {
        self.view?.showChooseCountryAlert()
    }
    @objc func openTaxPickleView() {
        self.view?.showChooseTaxAlert()
    }
}
