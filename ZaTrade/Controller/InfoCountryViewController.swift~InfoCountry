//
//  InfoCountryViewController.swift
//  ZaTrade
//
//  Created by Анастасия  on 17.10.2020.
//

import UIKit

final class InfoCountryViewController: UIViewController {
    
    let presenter = InfoCountryPresenter()
    
//    private let cView = CustomView(frame: CGRect(origin: CGPoint(x: 18, y: 91), size: CGSize(width: 335, height: 627)) )
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let mainLabel = UILabel()
    private let generalInfoLabel = UILabel()
    private let registerTaxFreeLabel = UILabel()
    private let firstStepLabel = UILabel()
    private let firstStepInfoLabel = UILabel()
    private let secondStepLabel = UILabel()
    private let secondStepInfoLabel = UILabel()
    private let thirdStepLabel = UILabel()
    private let thirdStepInfoLabel = UILabel()
    private let returnMoney = UILabel()



    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.setup()
    }

    private func setup() {
        
        let layer0 = CAGradientLayer()
        layer0.colors = [
          UIColor(red: 0.851, green: 0.122, blue: 0.663, alpha: 1).cgColor,
          UIColor(red: 0.851, green: 0.122, blue: 0.663, alpha: 1).cgColor,
          UIColor(red: 0.549, green: 0.184, blue: 0.733, alpha: 1).cgColor
        ]
        layer0.locations = [0, 0.42, 0.91]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -0.02, b: 0.78, c: -0.78, d: 0, tx: 0.99, ty: -0.14))
        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer0.position = view.center
        view.layer.addSublayer(layer0)
        
        
//        cView.frame = CGRect(x: 0, y: 0, width: 335, height: 627)
//        view.addSubview(cView)
//        cView.addSubview(scrollView)

        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        mainLabel.frame.size = CGSize(width: 311, height: 21)
        mainLabel.backgroundColor = .white
        mainLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        mainLabel.font = UIFont(name: "Rubik-Bold", size: 18)
        mainLabel.text = "Общая информация."
        contentView.addSubview(mainLabel)
        
        generalInfoLabel.frame.size = CGSize( width: 263, height: 234)
        generalInfoLabel.backgroundColor = .white
        generalInfoLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        generalInfoLabel.font = UIFont(name: "Rubik-Light", size: 14)
        generalInfoLabel.numberOfLines = 0
        generalInfoLabel.lineBreakMode = .byWordWrapping
        generalInfoLabel.attributedText = NSMutableAttributedString(string: presenter.model.generalInfo )
        contentView.addSubview(generalInfoLabel)
        
        registerTaxFreeLabel.frame.size = CGSize(width: 311, height: 42)
        registerTaxFreeLabel.backgroundColor = .white
        registerTaxFreeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        registerTaxFreeLabel.font = UIFont(name: "Rubik-Bold", size: 18)
        registerTaxFreeLabel.numberOfLines = 0
        registerTaxFreeLabel.lineBreakMode = .byWordWrapping
        registerTaxFreeLabel.text = "Как правильно оформить \n Tax Free? "
        contentView.addSubview(registerTaxFreeLabel)
        
        firstStepLabel.frame.size = CGSize( width: 71, height: 20)
        firstStepLabel.backgroundColor = .white
        firstStepLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        firstStepLabel.font = UIFont(name: "Rubik-Medium", size: 17)
        firstStepLabel.text = "I шаг"
        contentView.addSubview(firstStepLabel)

        firstStepInfoLabel.frame.size = CGSize(width: 263, height: 103)
        firstStepInfoLabel.backgroundColor = .white
        firstStepInfoLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        firstStepInfoLabel.font = UIFont(name: "Rubik-Light", size: 14)
        firstStepInfoLabel.numberOfLines = 0
        firstStepInfoLabel.lineBreakMode = .byWordWrapping
        firstStepInfoLabel.attributedText = NSMutableAttributedString(string: presenter.model.firstStep )
        contentView.addSubview(firstStepInfoLabel)
        
        secondStepLabel.frame.size = CGSize (width: 71, height: 20)
        secondStepLabel.backgroundColor = .white
        secondStepLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        secondStepLabel.font = UIFont(name: "Rubik-Medium", size: 17)
        secondStepLabel.text = "II шаг"
        contentView.addSubview(secondStepLabel)
        
        secondStepInfoLabel.frame.size = CGSize(width: 264, height: 198)
        secondStepInfoLabel.backgroundColor = .white
        secondStepInfoLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        secondStepInfoLabel.font = UIFont(name: "Rubik-Light", size: 14)
        secondStepInfoLabel.numberOfLines = 0
        secondStepInfoLabel.lineBreakMode = .byWordWrapping
        secondStepInfoLabel.attributedText = NSMutableAttributedString(string: presenter.model.secondStep )
        contentView.addSubview(secondStepInfoLabel)
        
        thirdStepLabel.frame.size = CGSize(width: 71, height: 20)
        thirdStepLabel.backgroundColor = .white
        thirdStepLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        thirdStepLabel.font = UIFont(name: "Rubik-Medium", size: 17)
        thirdStepLabel.text = "III шаг"
        contentView.addSubview(thirdStepLabel)
        
        thirdStepInfoLabel.frame.size = CGSize( width: 263, height: 103)
        thirdStepInfoLabel.backgroundColor = .white
        thirdStepInfoLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        thirdStepInfoLabel.font = UIFont(name: "Rubik-Light", size: 14)
        thirdStepInfoLabel.numberOfLines = 0
        thirdStepInfoLabel.lineBreakMode = .byWordWrapping
        thirdStepInfoLabel.attributedText = NSMutableAttributedString(string: presenter.model.thirdStep )
        contentView.addSubview(thirdStepInfoLabel)
        
        returnMoney.frame.size = CGSize(width: 174, height: 20)
        returnMoney.backgroundColor = .white
        returnMoney.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        returnMoney.font = UIFont(name: "Rubik-Medium", size: 17)
        returnMoney.text = "Где вернуть деньги?"
        contentView.addSubview(returnMoney)



    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
    func setupConstraints() {
        [
//          self.cView,
            self.mainLabel, self.generalInfoLabel,
            self.registerTaxFreeLabel,
            self.scrollView, self.contentView,
            self.firstStepLabel, self.firstStepInfoLabel,
            self.secondStepLabel, self.secondStepInfoLabel,
            self.thirdStepLabel, self.thirdStepInfoLabel,
            self.returnMoney
            
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        [
//            self.cView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            self.cView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            self.cView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18),
//            self.cView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 22),
//            self.cView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 28),
//            self.cView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 12),

            self.scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            self.contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            self.contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            self.contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            
            self.mainLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 36),
            self.mainLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 25),
            
            self.generalInfoLabel.topAnchor.constraint(equalTo: self.mainLabel.bottomAnchor, constant: 17),
            self.generalInfoLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 36),
            self.generalInfoLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 36),
            
            self.registerTaxFreeLabel.topAnchor.constraint(equalTo: self.generalInfoLabel.bottomAnchor, constant: 27),
            self.registerTaxFreeLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 25),

            self.firstStepLabel.topAnchor.constraint(equalTo: self.registerTaxFreeLabel.bottomAnchor, constant: 18),
            self.firstStepLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 36),
            self.firstStepLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 228),

            self.firstStepInfoLabel.topAnchor.constraint(equalTo: self.firstStepLabel.bottomAnchor, constant: 4),
            self.firstStepInfoLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 37),
            self.firstStepInfoLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 35),
            
            self.secondStepLabel.topAnchor.constraint(equalTo: self.firstStepInfoLabel.bottomAnchor, constant: 22),
            self.secondStepLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 36),
            self.secondStepLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 228),
            
            self.secondStepInfoLabel.topAnchor.constraint(equalTo: self.secondStepLabel.bottomAnchor, constant: 4),
            self.secondStepInfoLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 37),
            self.secondStepInfoLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 35),
            
            self.thirdStepLabel.topAnchor.constraint(equalTo: self.secondStepInfoLabel.bottomAnchor, constant: 22),
            self.thirdStepLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 36),
            self.thirdStepLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 228),
            
            self.thirdStepInfoLabel.topAnchor.constraint(equalTo: self.thirdStepLabel.bottomAnchor, constant: 4),
            self.thirdStepInfoLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 37),
            self.thirdStepInfoLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 35),
            
            self.returnMoney.topAnchor.constraint(equalTo: self.thirdStepInfoLabel.bottomAnchor, constant: 22),
            self.returnMoney.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 36),
            
            
        ].forEach {$0.isActive = true}
    }
    
}
