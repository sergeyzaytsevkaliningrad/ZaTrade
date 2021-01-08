import UIKit


final class AddProductViewController: CardViewController {
    
    
    var isEditingView: Bool = false
    let presenter = AddProductPresenter()

    init(isEditingView: Bool) {
        super.init(nibName: nil, bundle: nil)
        self.isEditingView = isEditingView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let name = UILabel()
    let nameTextField = UITextField()
    let country = UILabel()
    let tax = UILabel()
    let chooseCountry = ChooseCountryButton()
    let typeTax = ChooseCountryButton()
    let price = UILabel()
    let priceTextField = UITextField()
    let descriptionProduct = UILabel()
    let descriptionProductTextField = UITextField()
    let addProduct = LetsGoButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.presenter.isEditing = self.isEditingView
        if isEditingView {
        }
        self.hideKeyboardWhenTappedAround()
        self.nameTextField.delegate = self
        self.priceTextField.delegate = self
        self.descriptionProductTextField.delegate = self
        self.setup()
    }
    
    private func setup() {
        setupNameLabel()
        setupNameTextField()
        setupDescriptionProductLabel()
        setupDescriptionProductTextField()
        setupChooseCountry()
        setupTypeTax()
        setupPriceLabel()
        setupPriceTextField()
        setupAddProductButton()
    }
    
    func setupConstraints() {
        [
            self.name,
            self.nameTextField,
            self.descriptionProduct,
            self.descriptionProductTextField,
            self.chooseCountry,
            self.typeTax,
            self.price,
            self.priceTextField,
            self.addProduct,
            self.country,
            self.tax
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        [
            self.name.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 46),
            self.name.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            
            self.nameTextField.topAnchor.constraint(equalTo: self.name.bottomAnchor, constant: 10),
            self.nameTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.nameTextField.widthAnchor.constraint(equalToConstant: 330),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.descriptionProduct.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 10),
            self.descriptionProduct.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            
            self.descriptionProductTextField.topAnchor.constraint(equalTo: self.descriptionProduct.bottomAnchor, constant: 10),
            self.descriptionProductTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.descriptionProductTextField.widthAnchor.constraint(equalToConstant: 330),
            self.descriptionProductTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.price.topAnchor.constraint(equalTo: self.descriptionProductTextField.bottomAnchor, constant: 10),
            self.price.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),

            self.priceTextField.topAnchor.constraint(equalTo: self.price.bottomAnchor, constant: 10),
            self.priceTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.priceTextField.widthAnchor.constraint(equalToConstant: 330),
            self.priceTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.country.topAnchor.constraint(equalTo: self.priceTextField.bottomAnchor, constant: 10),
            self.country.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            
            self.chooseCountry.topAnchor.constraint(equalTo: self.country.bottomAnchor, constant: 10),
            self.chooseCountry.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            self.tax.topAnchor.constraint(equalTo: self.chooseCountry.bottomAnchor, constant: 10),
            self.tax.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
    
            self.typeTax.topAnchor.constraint(equalTo: self.tax.bottomAnchor, constant: 10),
            self.typeTax.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            self.addProduct.topAnchor.constraint(equalTo: self.typeTax.bottomAnchor, constant: 20),
            self.addProduct.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ].forEach {$0.isActive = true}
        
    }
        
    func setupNameLabel() {
        view.addSubview(self.name)
        name.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        name.font = UIFont(name: "Rubik-Light", size: 18)
        name.text = "Наименование"
    }
    
    func setupNameTextField() {
        view.addSubview(self.nameTextField)
        nameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        nameTextField.backgroundColor = UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 0.32)
        nameTextField.textAlignment = .left
        nameTextField.placeholder = "Наименование товара"
        nameTextField.text = presenter.product.entity?.name
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    func setupChooseCountry() {
        view.addSubview(self.country)
        country.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        country.font = UIFont(name: "Rubik-Light", size: 18)
        country.text = "Страна"
        self.view.addSubview(self.chooseCountry)
        self.chooseCountry.countryFlag.text = "?"
        self.chooseCountry.countryFlag.textColor = .black
        self.chooseCountry.countryTitle.text = "Выберите страну"
        self.chooseCountry.countryTitle.textColor = .gray
        self.chooseCountry.addTarget(self.presenter, action: #selector(self.presenter.openCountryPickleView), for: .touchUpInside)
    }
    
    func showChooseCountryAlert() {
        let alert = UIAlertController(title: "Выберите страну", message: "\n\n\n\n\n\n\n\n\n\n", preferredStyle: .alert)
        alert.isModalInPopover = true
        
        let pickerView_country = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 200))
        pickerView_country.tag = 1
        pickerView_country.dataSource = self
        pickerView_country.delegate = self
        pickerView_country.selectRow(self.presenter.currentCountryIndex ?? -1, inComponent: 0, animated: false)
        alert.view.addSubview(pickerView_country)
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Выбрать", style: .default, handler: { (action: UIAlertAction) in
            self.presenter.currentCountryIndex = pickerView_country.selectedRow(inComponent: 0)
        }))
        
        self.present(alert, animated: true)
    }
    
    func setupTypeTax() {
        view.addSubview(self.tax)
        tax.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tax.font = UIFont(name: "Rubik-Light", size: 18)
        tax.text = "Тип налога"
        self.view.addSubview(self.typeTax)
        self.typeTax.countryFlag.text = "?"
        self.typeTax.countryFlag.textColor = .black
        self.typeTax.countryTitle.text = "Выберите тип налога"
        self.typeTax.countryTitle.textColor = .gray
        self.typeTax.addTarget(self.presenter, action: #selector(self.presenter.openTaxPickleView), for: .touchUpInside)
    }
    
    func showChooseTaxAlert() {
        let alert = UIAlertController(title: "Выберите тип налога", message: "\n\n\n\n\n\n\n\n\n\n\n\n" , preferredStyle: .alert)
        alert.isModalInPopover = true
        
        let pickerView_tax = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 200))
        pickerView_tax.tag = 2
        pickerView_tax.dataSource = self
        pickerView_tax.delegate = self
        pickerView_tax.selectRow(self.presenter.currentTaxIndex ?? -1, inComponent: 0, animated: false)
        alert.view.addSubview(pickerView_tax)
    
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Выбрать", style: .default, handler: { (action: UIAlertAction) in
            self.presenter.currentTaxIndex = pickerView_tax.selectedRow(inComponent: 0)
        }))
        
        self.present(alert, animated: true)
    }
    
    func setupPriceLabel(){
        view.addSubview(self.price)
        price.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        price.font = UIFont(name: "Rubik-Light", size: 18)
        price.text = "Цена в валюте страны"
    }
    
    func setupPriceTextField() {
        view.addSubview(self.priceTextField)
        priceTextField.borderStyle = UITextField.BorderStyle.roundedRect
        priceTextField.backgroundColor =  UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 0.32)
        priceTextField.textAlignment = .left
        priceTextField.keyboardType = .numberPad
        priceTextField.placeholder = "Цена"
        if let text = presenter.product.entity?.price {
            priceTextField.text = "\(text)"
        } else {
            priceTextField.text = ""
        }
        priceTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func setupDescriptionProductLabel(){
        view.addSubview(self.descriptionProduct)
        descriptionProduct.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        descriptionProduct.font = UIFont(name: "Rubik-Light", size: 18)
        descriptionProduct.text = "Описание товара"
    }
    
    func setupDescriptionProductTextField() {
        view.addSubview(self.descriptionProductTextField)
        descriptionProductTextField.borderStyle = UITextField.BorderStyle.roundedRect
        descriptionProductTextField.backgroundColor = UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 0.32)
        descriptionProductTextField.textAlignment = .left
        descriptionProductTextField.placeholder = "Описание"
        descriptionProductTextField.text = presenter.product.entity?.extra
        descriptionProductTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }

    func setupAddProductButton() {
        view.addSubview(self.addProduct)
        addProduct.isEnabled = false
        addProduct.text  = isEditingView ? "Сохранить" : "Добавить товар"
        addProduct.addTarget(self.presenter, action: #selector(self.presenter.saveButtonAction), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        self.presenter.checkTextfields()
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension AddProductViewController: UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            return self.presenter.countries.count
        }
        else {
            return self.presenter.tax.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1) {
            let country = self.presenter.countries[row].entity!
            return "\(country.flag!) \(country.name!)"
        }
        else {
            let tax = self.presenter.tax[row].entity!
            return "\(tax.name!)"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1) {
            presenter.currentCountryIndex = row
            presenter.selectedCountry = self.presenter.countries[row].entity!.name!
        }
        else {
            presenter.currentTaxIndex = row
        }
    }
}


