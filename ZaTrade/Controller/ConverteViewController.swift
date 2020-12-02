import UIKit

class ConverterViewController: BaseViewController {
    
    let textfield = UITextField()
    let resultLabel = UILabel()
    let swapButton = SwapButton()
    let curentPicker = UIPickerView()
    let toPicker = UIPickerView()
    let convertButton = ConvertButton()
    
    var input: String?
    
    private var presenter = ConverterPresenter()
    
    private let screenSize = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self

        self.layoutTextField()
        self.layoutSwapButton()
        self.layoutResultLabel()
        self.layoutCurrentPicker()
        self.layoutToPicker()
        
    }
    
    func layoutTextField() {
        self.view.addSubview(textfield)
        textfield.delegate = self
        textfield.placeholder = "Введите сумму"
        textfield.keyboardType = .numberPad
        textfield.textAlignment = .natural
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func layoutResultLabel() {
        self.view.addSubview(resultLabel)
        resultLabel.text = ""
        resultLabel.textAlignment = .natural
        resultLabel.layer.borderWidth = 1
        resultLabel.layer.borderColor = UIColor.black.withAlphaComponent(0.3).cgColor
        resultLabel.layer.cornerRadius = 6
        resultLabel.layer.backgroundColor = UIColor.white.cgColor
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text: String? = textField.text
        self.input = text
        self.presenter.convert()
    }
    
    func layoutSwapButton() {
        self.view.addSubview(swapButton)
        swapButton.addTarget(self, action: #selector(self.swap), for: .touchUpInside)
    }
    
    func layoutCurrentPicker() {
        self.view.addSubview(self.curentPicker)
        curentPicker.backgroundColor = .white
        curentPicker.layer.cornerRadius = 10
        curentPicker.dataSource = self
        curentPicker.delegate = self
        curentPicker.selectRow(self.presenter.currentCurrencyIndex ?? -1, inComponent: 0, animated: true)
    }
    
    func layoutToPicker() {
        self.view.addSubview(self.toPicker)
        toPicker.backgroundColor = .white
        toPicker.layer.cornerRadius = 10
        toPicker.dataSource = self
        toPicker.delegate = self
        toPicker.selectRow(self.presenter.convertCurrencyIndex ?? -1, inComponent: 0, animated: true)
    }
    
    @objc func swap(sender: SwapButton) {
        presenter.swap(sender: sender)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func setupConstraints() {
        [
            toPicker,
            curentPicker,
            resultLabel,
            textfield,
            swapButton,
            
        ].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            toPicker.leadingAnchor.constraint(equalTo: resultLabel.trailingAnchor , constant: 20),
            toPicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            toPicker.heightAnchor.constraint(equalTo: self.resultLabel.heightAnchor),
            toPicker.topAnchor.constraint(equalTo: self.curentPicker.bottomAnchor, constant: 20),
            
            curentPicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            curentPicker.leadingAnchor.constraint(equalTo: self.textfield.trailingAnchor, constant: 20),
            curentPicker.heightAnchor.constraint(equalTo: self.textfield.heightAnchor),
            curentPicker.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            resultLabel.topAnchor.constraint(equalTo: self.textfield.bottomAnchor, constant: 20),
            resultLabel.heightAnchor.constraint(equalTo: self.textfield.heightAnchor),
            resultLabel.widthAnchor.constraint(equalTo: self.textfield.widthAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
            textfield.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            textfield.heightAnchor.constraint(equalToConstant: screenSize.height / 14),
            textfield.widthAnchor.constraint(equalToConstant: self.screenSize.width / 2),
            textfield.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            swapButton.topAnchor.constraint(equalTo: toPicker.bottomAnchor, constant: 20),
            swapButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            swapButton.widthAnchor.constraint(equalTo: toPicker.widthAnchor),
            swapButton.heightAnchor.constraint(equalTo: toPicker.heightAnchor),
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
}

extension ConverterViewController: UIPickerViewDelegate, UIPickerViewDataSource {    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.presenter.currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let currency = self.presenter.currencies[row].entity!
        return "\(currency.name!)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == self.curentPicker {
            self.presenter.currentCurrencyIndex = row
        }
        
        if pickerView == self.toPicker {
            self.presenter.convertCurrencyIndex = row
        }
    }
}


