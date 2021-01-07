import UIKit

class TaxFreeCalculateController: CardViewController {
    
    let presenter = TaxFreeCalculatePresenter()
    let textField = UITextField(frame: .zero)
    let topCurrencyLabel = UILabel(frame: .zero)
    let taxType = UIPickerView(frame: .zero)
    let toCountButton = LetsGoButton()
    let taxCount = UILabel()
    let resultUSD = UILabel()
    let resultRUB = UILabel()
    var chooseItem = UIBarButtonItem()
    
    private let spacing: CGFloat = 15
    
    var sign: String?
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        self.layoutTextField()
        self.layoutTopLabel()
        self.layoutTaxType()
        self.layoutToCountButton()
        self.layoutRUB()
        self.layoutUSD()
        self.layoutTaxCount()
        self.layoutBarItem()
        
    }
    
    // MARK: - LayoutFuncs
    
    private func layoutBarItem() {
        self.chooseItem = UIBarButtonItem(
            title: presenter.countries.first?.flag,
            style: .plain,
            target: self,
            action: #selector(self.tabItemAction)
        )
    }
    
    private func layoutRUB() {
        self.view.addSubview(self.resultRUB)
        resultRUB.text = ""
        resultRUB.textAlignment = .center
    }
    
    private func layoutUSD() {
        self.view.addSubview(self.resultUSD)
        resultUSD.text = "" 
        resultUSD.textAlignment = .center
    }
    
    private func layoutTaxCount() {
        self.view.addSubview(self.taxCount)
        taxCount.text = "" 
        taxCount.textAlignment = .center
        taxCount.lineBreakMode = .byWordWrapping
        taxCount.numberOfLines = 0
    }
    
    private func layoutToCountButton() {
        self.view.addSubview(toCountButton)
        self.toCountButton.text = "Рассчитать"
        self.toCountButton.addTarget(self.presenter, action: #selector(self.presenter.count), for: .touchUpInside)
    }
    
    private func layoutTaxType() {
        self.view.addSubview(taxType)
        taxType.tag = 1
        taxType.delegate = self
        taxType.dataSource = self
        taxType.layer.cornerRadius = 6
        taxType.layer.borderWidth = 1
        taxType.layer.borderColor = UIColor.black.withAlphaComponent(0.3).cgColor
        taxType.selectRow(self.presenter.currentTaxIndex ?? -1, inComponent: 0, animated: true)
        
    }
    
    private func layoutTopLabel() {
        self.view.addSubview(topCurrencyLabel)
        topCurrencyLabel.text = sign
        topCurrencyLabel.textAlignment = .natural
        topCurrencyLabel.layer.borderWidth = 1
        topCurrencyLabel.layer.borderColor = UIColor.black.withAlphaComponent(0.3).cgColor
        topCurrencyLabel.layer.cornerRadius = 6
        topCurrencyLabel.layer.backgroundColor = UIColor.white.cgColor        
        
    }
    
    private func layoutTextField() {
        self.view.addSubview(self.textField)
        textField.placeholder =  "Введите цену в валюте"
        textField.borderStyle = .roundedRect
        textField.text = ""
        textField.keyboardType = .numberPad
    }
    
    override func viewDidLayoutSubviews() {
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        
        [
            textField,
            topCurrencyLabel,
            taxType,
            toCountButton,
            taxCount,
            resultUSD,
            resultRUB,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            
            self.textField.leadingAnchor.constraint(equalTo: self.cardView.leadingAnchor, constant: spacing),
            self.textField.topAnchor.constraint(equalTo: self.cardView.topAnchor, constant: spacing),
            self.textField.heightAnchor.constraint(equalToConstant: 60),
            self.textField.widthAnchor.constraint(equalToConstant: cardView.bounds.width * 0.8),
            
            self.topCurrencyLabel.topAnchor.constraint(equalTo: self.textField.topAnchor),
            self.topCurrencyLabel.trailingAnchor.constraint(equalTo: self.cardView.trailingAnchor, constant: -spacing),
            self.topCurrencyLabel.heightAnchor.constraint(equalTo: self.textField.heightAnchor),
            self.topCurrencyLabel.leadingAnchor.constraint(equalTo: self.textField.trailingAnchor, constant: 5),
            
            self.taxType.topAnchor.constraint(equalTo: self.topCurrencyLabel.bottomAnchor, constant: spacing),
            self.taxType.trailingAnchor.constraint(equalTo: self.cardView.trailingAnchor, constant: -spacing),
            self.taxType.heightAnchor.constraint(equalToConstant: 60),
            self.taxType.leadingAnchor.constraint(equalTo: self.cardView.leadingAnchor, constant: spacing),
            
            taxCount.topAnchor.constraint(equalTo: self.taxType.bottomAnchor, constant: spacing),
            taxCount.leadingAnchor.constraint(equalTo: self.cardView.leadingAnchor, constant: spacing),
            taxCount.trailingAnchor.constraint(equalTo: self.cardView.trailingAnchor, constant: -spacing),
            taxCount.heightAnchor.constraint(equalTo: self.textField.heightAnchor),
            
            resultUSD.leadingAnchor.constraint(equalTo: self.cardView.leadingAnchor, constant: spacing),
            resultUSD.topAnchor.constraint(equalTo: self.taxCount.bottomAnchor, constant: spacing),
            resultUSD.heightAnchor.constraint(equalTo: self.taxCount.heightAnchor),
            resultUSD.trailingAnchor.constraint(equalTo: self.cardView.trailingAnchor, constant: -spacing),
            
            resultRUB.topAnchor.constraint(equalTo: resultUSD.bottomAnchor, constant: spacing),
            resultRUB.leadingAnchor.constraint(equalTo: self.cardView.leadingAnchor, constant: spacing),
            resultRUB.trailingAnchor.constraint(equalTo: self.cardView.trailingAnchor, constant: -spacing),
            resultRUB.heightAnchor.constraint(equalTo: resultUSD.heightAnchor),
            
            self.toCountButton.topAnchor.constraint(equalTo: self.resultRUB.bottomAnchor, constant: spacing),
            self.toCountButton.centerXAnchor.constraint(equalTo: self.cardView.centerXAnchor)
            
            
        ].forEach {
            $0.isActive = true
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.navigationItem.rightBarButtonItem = self.chooseItem
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.parent?.navigationItem.rightBarButtonItem = nil
    }
    
    @objc private func tabItemAction() {
        let alert = UIAlertController(title: "Выберите страну", message: nil, preferredStyle: .alert)
        alert.isModalInPopover = true
        
        let pickerView = UIPickerView()
        pickerView.tag = 2
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(self.presenter.currentCountryIndex ?? -1, inComponent: 0, animated: false)
        
        alert.view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor).isActive = true
        pickerView.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 60).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -44).isActive = true
        
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Выбрать", style: .default, handler: { (action: UIAlertAction) in
            self.presenter.currentCountryIndex = pickerView.selectedRow(inComponent: 0)
        }))
        
        self.present(alert, animated: true)
    }
    
}

extension TaxFreeCalculateController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return self.presenter.currentTaxes.count
        } else {
            return self.presenter.countries.count
        }
         
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            let tax = self.presenter.currentTaxes[row]
            return "\(tax.name!)"
        } else {
            let country = self.presenter.countries[row]
            return "\(country.flag!) \(country.name!)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            self.presenter.currentTaxIndex = row
        } else {
            self.presenter.currentCountryIndex = row
        }
    }
}
