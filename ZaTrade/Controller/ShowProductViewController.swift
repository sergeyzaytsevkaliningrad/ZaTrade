import UIKit
import CoreData

final class ShowProductViewController: CardViewController {
    
    lazy var presenter = ShowProductPresenter()
    
    private let name = UILabel()
    private let nameLabel = UILabel()
    private let price = UILabel()
    private let priceLabel = UILabel()
    private let descriptionProduct = UILabel()
    private let descriptionProductLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewController = self
        self.setup()
    }
    
    private func setup() {
        setupEditButton()
        setupNameLabel()
        setupNameInfoLabel()
        setupPriceLabel()
        setupPriceInfoLabel()
        setupDescriptionProductLabel()
        setupDescriptionProductInfoLabel()
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
            self.price,
            self.priceLabel,
            self.descriptionProduct,
            self.descriptionProductLabel
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        [

            self.name.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 46),
            self.name.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.name.bottomAnchor, constant: 10),
            self.nameLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.nameLabel.widthAnchor.constraint(equalToConstant: 330),
            
            self.price.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10),
            self.price.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),

            self.priceLabel.topAnchor.constraint(equalTo: self.price.bottomAnchor, constant: 10),
            self.priceLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.priceLabel.widthAnchor.constraint(equalToConstant: 330),
            
            self.descriptionProduct.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 10),
            self.descriptionProduct.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),

            self.descriptionProductLabel.topAnchor.constraint(equalTo: self.descriptionProduct.bottomAnchor, constant: 10),
            self.descriptionProductLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.descriptionProductLabel.widthAnchor.constraint(equalToConstant: 330),
            
        ].forEach {$0.isActive = true}
        
    }
        
    func setupNameLabel() {
        view.addSubview(self.name)
        name.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        name.font = UIFont(name: "Rubik-Medium", size: 18)
        name.text = "Наименование"
    }
    
    func setupNameInfoLabel() {
        view.addSubview(nameLabel)
        nameLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        nameLabel.layer.masksToBounds = true
        nameLabel.layer.cornerRadius = 7
        nameLabel.font = UIFont(name: "Rubik-Light", size: 18)
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.text = presenter.product.entity?.name
    }
    
    func setupPriceLabel() {
        view.addSubview(self.price)
        price.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        price.font = UIFont(name: "Rubik-Medium", size: 18)
        price.text = "Цена"
    }
    
    func setupPriceInfoLabel() {
        view.addSubview(priceLabel)
        priceLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        priceLabel.layer.masksToBounds = true
        priceLabel.layer.cornerRadius = 7
        priceLabel.font = UIFont(name: "Rubik-Light", size: 18)
        priceLabel.numberOfLines = 0
        priceLabel.lineBreakMode = .byWordWrapping
        priceLabel.text = "\(presenter.product.entity!.price) \(presenter.product.entity!.country!.currency!.sign!)"
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
        descriptionProductLabel.text = presenter.product.entity?.extra
    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
}
