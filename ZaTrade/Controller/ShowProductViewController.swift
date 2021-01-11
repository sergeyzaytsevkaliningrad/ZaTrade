import UIKit
import CoreData

final class ShowProductViewController: CardViewController {
    
    lazy var presenter = ShowProductPresenter()
    
    private let name = UILabel()
    private let nameLabel = UILabel()
    private let descriptionProduct = UILabel()
    private let descriptionProductLabel = UILabel()
    private let country = UILabel()
    private let countryLabel = UILabel()
    private let typeTax = UILabel()
    private let typeTaxLabel = UILabel()
    private let price = UILabel()
    private let priceLabel = UILabel()
    private let priceRUB = UILabel()
    private let priceRUBLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewController = self
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setup()
    }
    
    private func setup() {
        setupEditButton()
        setupNameLabel()
        setupNameInfoLabel()
        setupCountryLabel()
        setupCountryInfoLabel()
        setupPriceLabel()
        setupPriceInfoLabel()
        setupDescriptionProductLabel()
        setupDescriptionProductInfoLabel()
        setupTypeTaxLabel()
        setupTypeTaxInfoLabel()
        setupPriceRUB()
    }
    
    
    func setupEditButton() {
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "pencil.circle.fill"), style: .plain, target: self.presenter, action: #selector(self.presenter.showEdit)),
            UIBarButtonItem(image: UIImage(systemName: "trash.circle.fill"), style: .plain, target: self.presenter, action: #selector(self.presenter.delete))
        ]
    }
    
    
    func setupConstraints() {
        [
            self.name,
            self.nameLabel,
            self.country,
            self.countryLabel,
            self.price,
            self.priceLabel,
            self.descriptionProduct,
            self.descriptionProductLabel,
            self.typeTax,
            self.typeTaxLabel,
            self.priceRUB,
            self.priceRUBLabel
            
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        [

            self.name.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 46),
            self.name.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.name.bottomAnchor, constant: 10),
            self.nameLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.nameLabel.widthAnchor.constraint(equalToConstant: 330),
            
            self.descriptionProduct.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10),
            self.descriptionProduct.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),

            self.descriptionProductLabel.topAnchor.constraint(equalTo: self.descriptionProduct.bottomAnchor, constant: 10),
            self.descriptionProductLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.descriptionProductLabel.widthAnchor.constraint(equalToConstant: 330),
            
            self.country.topAnchor.constraint(equalTo: self.descriptionProductLabel.bottomAnchor, constant: 10),
            self.country.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            
            self.countryLabel.topAnchor.constraint(equalTo: self.country.bottomAnchor, constant: 10),
            self.countryLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.countryLabel.widthAnchor.constraint(equalToConstant: 330),
            
            self.typeTax.topAnchor.constraint(equalTo: self.countryLabel.bottomAnchor, constant: 10),
            self.typeTax.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            
            self.typeTaxLabel.topAnchor.constraint(equalTo: self.typeTax.bottomAnchor, constant: 10),
            self.typeTaxLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.typeTaxLabel.widthAnchor.constraint(equalToConstant: 330),
            
            self.price.topAnchor.constraint(equalTo: self.typeTaxLabel.bottomAnchor, constant: 10),
            self.price.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),

            self.priceLabel.topAnchor.constraint(equalTo: self.price.bottomAnchor, constant: 10),
            self.priceLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.priceLabel.widthAnchor.constraint(equalToConstant: 330),
            
            self.priceRUB.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 10),
            self.priceRUB.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            
            self.priceRUBLabel.topAnchor.constraint(equalTo: self.priceRUB.bottomAnchor, constant: 10),
            self.priceRUBLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.priceRUBLabel.widthAnchor.constraint(equalToConstant: 330),
            
        ].forEach {$0.isActive = true}
        
    }
    
    func setupNameLabel() {
        view.addSubview(self.name)
        name.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        name.font = UIFont(name: "Rubik-Medium", size: 18)
        name.text = "Наименование товара"
    }
    
    func setupNameInfoLabel() {
        view.addSubview(nameLabel)
        nameLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        nameLabel.layer.masksToBounds = true
        nameLabel.layer.cornerRadius = 7
        nameLabel.font = UIFont(name: "Rubik-Light", size: 18)
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.text = presenter.product!.entity?.name
    }
    
    func setupCountryLabel() {
        view.addSubview(self.country)
        country.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        country.font = UIFont(name: "Rubik-Medium", size: 18)
        country.text = "Страна"
    }
    
    func setupCountryInfoLabel() {
        view.addSubview(countryLabel)
        countryLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        countryLabel.layer.masksToBounds = true
        countryLabel.layer.cornerRadius = 7
        countryLabel.font = UIFont(name: "Rubik-Light", size: 18)
        countryLabel.numberOfLines = 0
        countryLabel.lineBreakMode = .byWordWrapping
        countryLabel.text = presenter.product!.entity!.countryWithFlag
    }

    func setupTypeTaxLabel() {
        view.addSubview(self.typeTax)
        typeTax.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        typeTax.font = UIFont(name: "Rubik-Medium", size: 18)
        typeTax.text = "Тип налогообложения"
    }
    
    func setupTypeTaxInfoLabel() {
        view.addSubview(typeTaxLabel)
        typeTaxLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        typeTaxLabel.layer.masksToBounds = true
        typeTaxLabel.layer.cornerRadius = 7
        typeTaxLabel.font = UIFont(name: "Rubik-Light", size: 18)
        typeTaxLabel.numberOfLines = 0
        typeTaxLabel.lineBreakMode = .byWordWrapping
        typeTaxLabel.text = presenter.product!.entity?.tax!.name
    }
    
    func setupPriceLabel() {
        view.addSubview(self.price)
        price.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        price.font = UIFont(name: "Rubik-Medium", size: 18)
        price.text = "Цена в валюте"
    }
    
    func setupPriceInfoLabel() {
        view.addSubview(priceLabel)
        priceLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        priceLabel.layer.masksToBounds = true
        priceLabel.layer.cornerRadius = 7
        priceLabel.font = UIFont(name: "Rubik-Light", size: 18)
        priceLabel.numberOfLines = 0
        priceLabel.lineBreakMode = .byWordWrapping
        priceLabel.text = presenter.product!.entity!.formattedPrice
    }
    
    func setupDescriptionProductLabel(){
        view.addSubview(self.descriptionProduct)
        descriptionProduct.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        descriptionProduct.font = UIFont(name: "Rubik-Medium", size: 18)
        descriptionProduct.text = "Описание"
    }
    
    func setupDescriptionProductInfoLabel() {
        view.addSubview(descriptionProductLabel)
        descriptionProductLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        descriptionProductLabel.layer.masksToBounds = true
        descriptionProductLabel.layer.cornerRadius = 7
        descriptionProductLabel.font = UIFont(name: "Rubik-Light", size: 18)
        descriptionProductLabel.numberOfLines = 0
        descriptionProductLabel.lineBreakMode = .byWordWrapping
        descriptionProductLabel.text = presenter.product!.entity?.extra
    }
    
    func setupPriceRUB() {
        view.addSubview(self.priceRUB)
        priceRUB.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        priceRUB.font = UIFont(name: "Rubik-Medium", size: 18)
        priceRUB.text = "Цена в рублях"
        
        view.addSubview(self.priceRUBLabel)
        priceRUBLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        priceRUBLabel.layer.masksToBounds = true
        priceRUBLabel.font = UIFont(name: "Rubik-Light", size: 18)
        priceRUBLabel.numberOfLines = 0
        priceRUBLabel.lineBreakMode = .byWordWrapping
        priceRUBLabel.text = presenter.product!.entity!.formattedRubPrice
    }

    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
}
