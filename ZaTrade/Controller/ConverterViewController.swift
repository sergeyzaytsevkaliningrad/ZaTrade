import UIKit

class ConverterViewController: BaseViewController, UITextFieldDelegate {
    
    let textfield = UITextField()
    let resultLabel = UILabel()
    let swapButton = SwapButton()
    let curentPicker = UIPickerView()
    let toPicker = UIPickerView()
    let currentButton = UIButton()
    let toButton = UIButton()
    let clearButton = UIButton(frame: .zero)
    var input: String?
    
    let presenter = ConverterPresenter()
    
    private let screenSize = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self

        self.layoutTextField()
        self.layoutSwapButton()
        self.layoutResultLabel()
        self.layoutCurrentButton()
        self.latoutToButton()
        self.layoutClearButton()
        
    }
    
    private func latoutToButton() {
        self.view.addSubview(toButton)
        toButton.setTitle("Валюта", for: .normal)
        toButton.backgroundColor = .white
        toButton.layer.cornerRadius = 6
        toButton.setTitleColor(.black, for: .normal)
        toButton.addTarget(self, action: #selector(self.toPick), for: .touchUpInside)
    }
    
    private func layoutCurrentButton() {
        self.view.addSubview(currentButton)
        currentButton.setTitle("Валюта", for: .normal)
        currentButton.backgroundColor = .white
        currentButton.layer.cornerRadius = 6
        currentButton.setTitleColor(.black, for: .normal)
        currentButton.addTarget(self, action: #selector(self.currentPick), for: .touchUpInside)
    }
    
    private func layoutClearButton() {
        self.view.addSubview(clearButton)
        clearButton.setTitle("Очистить", for: .normal)
        clearButton.backgroundColor = .white
        clearButton.layer.cornerRadius = 6
        clearButton.setTitleColor(.black, for: .normal)
        clearButton.addTarget(self, action: #selector(self.clear), for: .touchUpInside)
    }
    
    private func layoutTextField() {
        self.view.addSubview(textfield)
        textfield.delegate = self
        textfield.placeholder = "Введите сумму"
        textfield.keyboardType = .numberPad
        textfield.textAlignment = .natural
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func layoutResultLabel() {
        self.view.addSubview(resultLabel)
        resultLabel.text = ""
        resultLabel.textAlignment = .natural
        resultLabel.layer.borderWidth = 1
        resultLabel.layer.borderColor = UIColor.black.withAlphaComponent(0.3).cgColor
        resultLabel.layer.cornerRadius = 6
        resultLabel.layer.backgroundColor = UIColor.white.cgColor
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        let text: String? = textField.text
        self.input = text
        self.presenter.convert()
    }
    
    @objc private func clear() {
        self.input = ""
        self.textfield.text = ""
        self.presenter.convert()
    }
    
    @objc private func currentPick() {
        let alert = UIAlertController(title: "Выберите страну", message: nil, preferredStyle: .alert)
        alert.isModalInPopover = true
        curentPicker.dataSource = self
        curentPicker.delegate = self
        curentPicker.selectRow(self.presenter.currentCurrencyIndex ?? -1, inComponent: 0, animated: true)
        alert.view.addSubview(curentPicker)
        curentPicker.translatesAutoresizingMaskIntoConstraints = false
        curentPicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor).isActive = true
        curentPicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor).isActive = true
        curentPicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 60).isActive = true
        curentPicker.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -44).isActive = true
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Выбрать", style: .default, handler: { [self] (action: UIAlertAction) in
            self.presenter.currentCurrencyIndex = self.curentPicker.selectedRow(inComponent: 0)
        }))
        self.present(alert, animated: true)
    }
    
    @objc private func toPick() {
        let alert = UIAlertController(title: "Выберите страну", message: nil, preferredStyle: .alert)
        alert.isModalInPopover = true
        
        toPicker.dataSource = self
        toPicker.delegate = self
        toPicker.selectRow(self.presenter.convertCurrencyIndex ?? -1, inComponent: 0, animated: true)
        alert.view.addSubview(toPicker)
        toPicker.translatesAutoresizingMaskIntoConstraints = false
        toPicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor).isActive = true
        toPicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor).isActive = true
        toPicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 60).isActive = true
        toPicker.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -44).isActive = true
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Выбрать", style: .default, handler: { [self] (action: UIAlertAction) in
            self.presenter.convertCurrencyIndex = self.toPicker.selectedRow(inComponent: 0)
        }))
        self.present(alert, animated: true)
    }
    
    private func layoutSwapButton() {
        self.view.addSubview(swapButton)
        swapButton.addTarget(self, action: #selector(self.swap), for: .touchUpInside)
    }
    
    @objc private func swap(sender: SwapButton) {
        presenter.swap(sender: sender)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    private func setupConstraints() {
        [
            toButton,
            currentButton,
            resultLabel,
            textfield,
            swapButton,
            clearButton,
            
        ].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            toButton.leadingAnchor.constraint(equalTo: resultLabel.trailingAnchor , constant: 20),
            toButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            toButton.heightAnchor.constraint(equalTo: self.resultLabel.heightAnchor),
            toButton.topAnchor.constraint(equalTo: self.currentButton.bottomAnchor, constant: 20),
            
            currentButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            currentButton.leadingAnchor.constraint(equalTo: self.textfield.trailingAnchor, constant: 20),
            currentButton.heightAnchor.constraint(equalTo: self.textfield.heightAnchor),
            currentButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            resultLabel.topAnchor.constraint(equalTo: self.textfield.bottomAnchor, constant: 20),
            resultLabel.heightAnchor.constraint(equalTo: self.textfield.heightAnchor),
            resultLabel.widthAnchor.constraint(equalTo: self.textfield.widthAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
            textfield.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            textfield.heightAnchor.constraint(equalToConstant: screenSize.height / 14),
            textfield.widthAnchor.constraint(equalToConstant: self.screenSize.width / 2),
            textfield.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            swapButton.topAnchor.constraint(equalTo: toButton.bottomAnchor, constant: 20),
            swapButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            swapButton.widthAnchor.constraint(equalTo: toButton.widthAnchor),
            swapButton.heightAnchor.constraint(equalTo: toButton.heightAnchor),
            
            clearButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            clearButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            clearButton.widthAnchor.constraint(equalTo: resultLabel.widthAnchor),
            clearButton.heightAnchor.constraint(equalTo: resultLabel.heightAnchor),
            
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


