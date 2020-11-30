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
    
    private let name = UILabel()
    private let nameTextField = UITextField()
    private let price = UILabel()
    private let priceTextField = UITextField()
    private let descriptionProduct = UILabel()
    private let descriptionProductTextField = UITextField()
    private let typeTax = UILabel()
    private let typeTaxSwitch = CustomSwich()
    private let addProduct = LetsGoButton()
    
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
        setupPriceLabel()
        setupPriceTextField()
        setupDescriptionProductLabel()
        setupDescriptionProductTextField()
        setupTypeTaxLabel()
        setupTypeTaxSwitch()
        setupAddProductButton()
        
    }
    
    func setupConstraints() {
        [
            self.name,
            self.nameTextField,
            self.price,
            self.priceTextField,
            self.descriptionProduct,
            self.descriptionProductTextField,
            self.typeTax,
            self.typeTaxSwitch,
            self.addProduct
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        [
            self.name.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 46),
            self.name.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            
            self.nameTextField.topAnchor.constraint(equalTo: self.name.bottomAnchor, constant: 10),
            self.nameTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.nameTextField.widthAnchor.constraint(equalToConstant: 330),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.price.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 10),
            self.price.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),

            self.priceTextField.topAnchor.constraint(equalTo: self.price.bottomAnchor, constant: 10),
            self.priceTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.priceTextField.widthAnchor.constraint(equalToConstant: 330),
            self.priceTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.descriptionProduct.topAnchor.constraint(equalTo: self.priceTextField.bottomAnchor, constant: 10),
            self.descriptionProduct.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),

            self.descriptionProductTextField.topAnchor.constraint(equalTo: self.descriptionProduct.bottomAnchor, constant: 10),
            self.descriptionProductTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.descriptionProductTextField.widthAnchor.constraint(equalToConstant: 330),
            self.descriptionProductTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.typeTax.topAnchor.constraint(equalTo: self.descriptionProductTextField.bottomAnchor, constant: 30),
            self.typeTax.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            
            self.typeTaxSwitch.topAnchor.constraint(equalTo: self.descriptionProductTextField.bottomAnchor, constant: 30),
            self.typeTaxSwitch.leftAnchor.constraint(equalTo: self.typeTax.rightAnchor, constant: 168),
            
            self.addProduct.topAnchor.constraint(equalTo: self.typeTaxSwitch.bottomAnchor, constant: 20),
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
        nameTextField.backgroundColor = .white
        nameTextField.textAlignment = .left
        nameTextField.placeholder = "Наименование товара"
        nameTextField.text = presenter.showModel().ProductName
    }
    
    func setupPriceLabel(){
        view.addSubview(self.price)
        price.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        price.font = UIFont(name: "Rubik-Light", size: 18)
        price.text = "Цена"
    }
    
    func setupPriceTextField() {
        view.addSubview(self.priceTextField)
        priceTextField.borderStyle = UITextField.BorderStyle.roundedRect
        priceTextField.backgroundColor = .white
        priceTextField.textAlignment = .left
        priceTextField.keyboardType = .numberPad
        priceTextField.placeholder = "Цена товара"
    }
    
    func setupDescriptionProductLabel(){
        view.addSubview(self.descriptionProduct)
        descriptionProduct.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        descriptionProduct.font = UIFont(name: "Rubik-Light", size: 18)
        descriptionProduct.text = "Описание"
    }
    
    func setupDescriptionProductTextField() {
        view.addSubview(self.descriptionProductTextField)
        descriptionProductTextField.borderStyle = UITextField.BorderStyle.roundedRect
        descriptionProductTextField.backgroundColor = .white
        descriptionProductTextField.textAlignment = .left
        descriptionProductTextField.placeholder = "Описание товара"
    }
    
    func setupTypeTaxLabel() {
        view.addSubview(self.typeTax)
        typeTax.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        typeTax.font = UIFont(name: "Rubik-Light", size: 18)
        typeTax.text = "Вид налога"
    }
    
    func setupTypeTaxSwitch() {
        view.addSubview(self.typeTaxSwitch)
        
    }
    
    func setupAddProductButton() {
        view.addSubview(self.addProduct)
        addProduct.text  = isEditingView ? "Сохранить" : "Добавить товар"
        addProduct.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        presenter.addProductFunc(name: nameTextField.text, price: priceTextField.text, descr: descriptionProductTextField.text, typeTax: typeTaxSwitch.isOn )
    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder() // dismiss keyboard
            return true
        }
    
    func makeRedDescriptionProductText() {
        self.descriptionProductTextField.layer.borderWidth = 1
        self.descriptionProductTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    func makeRedPriceText() {
        self.priceTextField.layer.borderWidth = 1
        self.priceTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    func makeRedNameText() {
        self.nameTextField.layer.borderWidth = 1
        self.nameTextField.layer.borderColor = UIColor.red.cgColor
    }
}


extension UIViewController: UITextFieldDelegate {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

