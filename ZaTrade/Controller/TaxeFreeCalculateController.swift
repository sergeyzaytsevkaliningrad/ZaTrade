import UIKit

class TaxFreeCalculateController: CardViewController {
    
    let presenter = TaxFreeCalculatePresenter()
    let textField = UITextField(frame: .zero)
    let topCurrencyLabel = UILabel(frame: .zero)
    let taxType = UIPickerView(frame: .zero)
    
    var input: String?
    var sign: String?
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        self.layoutTextField()
        self.layoutTopLabel()
        
    }
    
    // MARK: - LayoutFuncs
    
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
        textField.text = self.input
    }
    
    override func viewDidLayoutSubviews() {
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        
        [
            textField,
            topCurrencyLabel,
            taxType
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
        
            self.textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.textField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.textField.heightAnchor.constraint(equalToConstant: 60),
            self.textField.trailingAnchor.constraint(equalTo: self.topCurrencyLabel.leadingAnchor, constant: -20),
            
            self.topCurrencyLabel.topAnchor.constraint(equalTo: self.textField.topAnchor),
            self.topCurrencyLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.topCurrencyLabel.heightAnchor.constraint(equalTo: self.textField.heightAnchor),
        
        ].forEach {
            $0.isActive = true
        }
        
    }
}
