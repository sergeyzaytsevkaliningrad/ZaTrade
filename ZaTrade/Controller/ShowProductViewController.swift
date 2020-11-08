//
//  ShowProductViewController.swift
//  ZaTrade
//
//  Created by Анастасия  on 08.11.2020.
//

import UIKit


final class ShowProductViewController: UIViewController {
    
    var presenter = ShowProductPresenter()
    
    private let name = UILabel()
    private let nameLabel = UILabel()
    private let price = UILabel()
    private let priceLabel = UILabel()
    private let descriptionProduct = UILabel()
    private let descriptionProductLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.setupBackground()
        self.setup()
    }
    
    private func setup() {
        setupNameLabel()
        setupNameInfoLabel()
        setupPriceLabel()
        setupPriceInfoLabel()
        setupDescriptionProductLabel()
        setupDescriptionProductInfoLabel()
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
    
    func setupBackground() {
        view.backgroundColor = .white
        let layer0 = CAGradientLayer()
        layer0.colors = [
            UIColor(red: 0.859, green: 0.278, blue: 0.71, alpha: 1).cgColor,
            UIColor(red: 0.62, green: 0.325, blue: 0.765, alpha: 1).cgColor ]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -0.02, b: 0.78, c: -0.78, d: 0, tx: 0.99, ty: -0.14))
        layer0.frame = view.bounds
        layer0.position = view.center
        view.layer.addSublayer(layer0)
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
        nameLabel.text = presenter.model.ProductName
    }
    
    func setupPriceLabel(){
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
        priceLabel.text = String(presenter.model.ProductPrice)
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
        descriptionProductLabel.text = presenter.model.ProductDescription
    }
    
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
}