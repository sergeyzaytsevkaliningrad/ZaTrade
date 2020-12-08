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
    }
    
    // MARK: - LayoutFuncs
    
    
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
        self.toCountButton.setTitle("Рассчитать", for: .normal)
        self.toCountButton.addTarget(self.presenter, action: #selector(self.presenter.count), for: .touchUpInside)
    }
    
    private func layoutTaxType() {
        self.view.addSubview(taxType)
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
    
}

extension TaxFreeCalculateController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.presenter.taxes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let tax = self.presenter.taxes[row].entity!
        return "\(tax.name!)"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.presenter.currentTaxIndex = row
    }
}
