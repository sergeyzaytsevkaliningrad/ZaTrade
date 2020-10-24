//
//  InfoCountryViewController.swift
//  ZaTrade
//
//  Created by Анастасия  on 17.10.2020.
//

import UIKit

protocol InfoCountryViewProtocol: class {}

final class InfoCountryViewController: UIViewController, InfoCountryViewProtocol {
    
    weak var presenter: InfoCountryPresenterProtocol?
    private let cView = CustomView(frame: CGRect(origin: CGPoint(x: 18, y: 91), size: CGSize(width: 335, height: 627)) )
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let mainLabel = UILabel()
    private let generalInfoLabel = UILabel()
    private let registerTaxFreeLabel = UILabel()
    private let firstStepLabel = UILabel()
    private let firstStepInfoLabel = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        
//        cView.frame.size = CGSize(width: 335, height: 627)
//        scrollView.addSubview(cView)
        
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        mainLabel.frame = CGRect(x: 0, y: 0, width: 311, height: 21)
        mainLabel.backgroundColor = .white
        mainLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        mainLabel.font = UIFont(name: "Rubik-Bold", size: 18)
        mainLabel.text = "Общая информация."
        contentView.addSubview(mainLabel)
        
        generalInfoLabel.frame = CGRect(x: 0, y: 0, width: 263, height: 234)
        generalInfoLabel.backgroundColor = .white
        generalInfoLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        generalInfoLabel.font = UIFont(name: "Rubik-Light", size: 14)
        generalInfoLabel.numberOfLines = 0
        generalInfoLabel.lineBreakMode = .byWordWrapping
        generalInfoLabel.text = presenter?.model?.generalInfo
        print(presenter?.model?.generalInfo)
        contentView.addSubview(generalInfoLabel)
        
        registerTaxFreeLabel.frame = CGRect(x: 0, y: 0, width: 311, height: 42)
        registerTaxFreeLabel.backgroundColor = .white
        registerTaxFreeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        registerTaxFreeLabel.font = UIFont(name: "Rubik-Bold", size: 18)
        registerTaxFreeLabel.numberOfLines = 0
        registerTaxFreeLabel.lineBreakMode = .byWordWrapping
        registerTaxFreeLabel.text = "Как правильно оформить \n Tax Free? "
        contentView.addSubview(registerTaxFreeLabel)
        
//        firstStepLabel.frame = CGRect(x: 0, y: 0, width: 71, height: 20)
//        firstStepLabel.backgroundColor = .white
//        firstStepLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//        firstStepLabel.font = UIFont(name: "Rubik-Medium", size: 17)
//        firstStepLabel.text = "I шаг"
//        contentView.addSubview(firstStepLabel)
//
//        firstStepInfoLabel.frame = CGRect(x: 0, y: 0, width: 263, height: 103)
//        firstStepInfoLabel.backgroundColor = .white
//        firstStepInfoLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//        firstStepInfoLabel.font = UIFont(name: "Rubik-Light", size: 14)
//        firstStepInfoLabel.numberOfLines = 0
//        firstStepInfoLabel.lineBreakMode = .byWordWrapping
//        firstStepInfoLabel.text = presenter?.model?.firstStep
//        contentView.addSubview(firstStepInfoLabel)


    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
    func setupConstraints() {
        [
//            self.cView,
            self.mainLabel,
            self.generalInfoLabel,
            self.registerTaxFreeLabel,
            self.scrollView,
            self.contentView
            
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        [
//            self.cView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            self.cView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            self.scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            self.contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            self.contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            self.contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            
            self.mainLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 34),
            self.mainLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 26),
            
            self.generalInfoLabel.topAnchor.constraint(equalTo: self.mainLabel.bottomAnchor, constant: 17),
            self.generalInfoLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 37),
            self.generalInfoLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 35),
            
            self.registerTaxFreeLabel.topAnchor.constraint(equalTo: self.generalInfoLabel.bottomAnchor, constant: 27),
            self.registerTaxFreeLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 26),

//            self.firstStepLabel.topAnchor.constraint(equalTo: self.registerTaxFreeLabel.bottomAnchor, constant: 18),
//            self.firstStepLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 37),
//            self.firstStepLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 227)

//            self.firstStepInfoLabel.topAnchor.constraint(equalTo: self.firstStepLabel.bottomAnchor, constant: 4),
//            self.firstStepInfoLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 38),
//            self.firstStepInfoLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 34)
            
        ].forEach {$0.isActive = true}
    }
    
}
