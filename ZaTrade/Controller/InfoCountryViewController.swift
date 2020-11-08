

//
//  InfoCountryViewController.swift
//  ZaTrade
//
//  Created by Анастасия  on 17.10.2020.
//

import UIKit
import MapKit

final class InfoCountryViewController: UIViewController {
    
    var presenter = InfoCountryPresenter()
    
    private let cView = CustomView()
    
    private let scrollView = UIScrollView()
    private let contentView = UIStackView()
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
    private var mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        setupBackground()
        view.addSubview(cView)

        self.setup()
    }
    
    private func setup() {
        
        cView.addSubview(scrollView)
        setupScrollView()
        
        scrollView.addSubview(contentView)
        setupContentView()

        setupMainLabel()
        setupGeneralInfo()
        setupRegisterTaxFreeLabel()
        setupFirstStepLabel()
        setupFirstStepInfoLabel()
        setupSecondStepLabel()
        setupSecondStepInfoLabel()
        setupThirdStepLabel()
        setupThirdStepInfoLabel()
        setupReturnMoney()
        setupLocation()

    }
    
    func setupConstraints() {
        [
            self.cView,
            self.scrollView,
            self.contentView,
            self.mainLabel,
            self.generalInfoLabel,
            self.registerTaxFreeLabel,
            self.firstStepLabel,
            self.firstStepInfoLabel,
            self.secondStepLabel,
            self.secondStepInfoLabel,
            self.thirdStepLabel,
            self.thirdStepInfoLabel,
            self.returnMoney,
            self.mapView
            
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        [
            self.cView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18),
            self.cView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -22),
            self.cView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 28),
            self.cView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -12),

//            self.mainLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.mainLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 25),
            self.mainLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

//            self.generalInfoLabel.topAnchor.constraint(equalTo: self.mainLabel.bottomAnchor, constant: 17),
            self.generalInfoLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 36),
            self.generalInfoLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -36),

//            self.registerTaxFreeLabel.topAnchor.constraint(equalTo: self.generalInfoLabel.bottomAnchor, constant: 27),
            self.registerTaxFreeLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 25),

//            self.firstStepLabel.topAnchor.constraint(equalTo: self.registerTaxFreeLabel.bottomAnchor, constant: 18),
            self.firstStepLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 36),
            self.firstStepLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -228),

//            self.firstStepInfoLabel.topAnchor.constraint(equalTo: self.firstStepLabel.bottomAnchor, constant: 4),
            self.firstStepInfoLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 37),
            self.firstStepInfoLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -35),

//            self.secondStepLabel.topAnchor.constraint(equalTo: self.firstStepInfoLabel.bottomAnchor, constant: 22),
            self.secondStepLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 36),
            self.secondStepLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -228),

//            self.secondStepInfoLabel.topAnchor.constraint(equalTo: self.secondStepLabel.bottomAnchor, constant: 4),
            self.secondStepInfoLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 37),
            self.secondStepInfoLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -35),

//            self.thirdStepLabel.topAnchor.constraint(equalTo: self.secondStepInfoLabel.bottomAnchor, constant: 22),
            self.thirdStepLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 36),
            self.thirdStepLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -228),

//            self.thirdStepInfoLabel.topAnchor.constraint(equalTo: self.thirdStepLabel.bottomAnchor, constant: 4),
            self.thirdStepInfoLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 37),
            self.thirdStepInfoLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -35),

//            self.returnMoney.topAnchor.constraint(equalTo: self.thirdStepInfoLabel.bottomAnchor, constant: 22),
            self.returnMoney.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 36),
            self.returnMoney.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -36),

//            self.mapView.topAnchor.constraint(equalTo: self.returnMoney.bottomAnchor, constant: 11),
            self.mapView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 25),
            self.mapView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -25),
            self.mapView.heightAnchor.constraint(equalToConstant: 366)

        ].forEach {$0.isActive = true}
        
    }
    
    func setupScrollView() {
        scrollView.layer.cornerRadius = 28
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.topAnchor.constraint(equalTo: cView.topAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: cView.bottomAnchor).isActive = true
        self.scrollView.leadingAnchor.constraint(equalTo: self.cView.leadingAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.cView.trailingAnchor).isActive = true
    }
    
    func setupContentView() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.spacing = 12
        self.contentView.axis = .vertical
        self.contentView.alignment = .firstBaseline
//        self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true;
        self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 28).isActive = true;
//        self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true;
        self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -28).isActive = true;
        self.contentView.widthAnchor.constraint(equalTo: self.cView.widthAnchor).isActive = true;
    }
    
    func setupMainLabel() {
        contentView.addArrangedSubview(mainLabel)
        mainLabel.backgroundColor = .white
        mainLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        mainLabel.font = UIFont(name: "Rubik-Bold", size: 18)
        mainLabel.text = presenter.model.title1
    }
    
    func setupGeneralInfo() {
        contentView.addArrangedSubview(generalInfoLabel)
        generalInfoLabel.backgroundColor = .white
        generalInfoLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        generalInfoLabel.font = UIFont(name: "Rubik-Light", size: 14)
        generalInfoLabel.numberOfLines = 0
        generalInfoLabel.lineBreakMode = .byWordWrapping
        generalInfoLabel.attributedText = NSMutableAttributedString(string: presenter.model.generalInfo)
    }
    
    func setupRegisterTaxFreeLabel() {
        contentView.addArrangedSubview(registerTaxFreeLabel)
        registerTaxFreeLabel.backgroundColor = .white
        registerTaxFreeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        registerTaxFreeLabel.font = UIFont(name: "Rubik-Bold", size: 18)
        registerTaxFreeLabel.numberOfLines = 0
        registerTaxFreeLabel.lineBreakMode = .byWordWrapping
        registerTaxFreeLabel.text = presenter.model.title2
    }
    
    func setupFirstStepLabel() {
        contentView.addArrangedSubview(firstStepLabel)
        firstStepLabel.backgroundColor = .white
        firstStepLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        firstStepLabel.font = UIFont(name: "Rubik-Medium", size: 17)
        firstStepLabel.text = presenter.model.title3
    }
    
    func setupFirstStepInfoLabel() {
        contentView.addArrangedSubview(firstStepInfoLabel)
        firstStepInfoLabel.backgroundColor = .white
        firstStepInfoLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        firstStepInfoLabel.font = UIFont(name: "Rubik-Light", size: 14)
        firstStepInfoLabel.numberOfLines = 0
        firstStepInfoLabel.lineBreakMode = .byWordWrapping
        firstStepInfoLabel.attributedText = NSMutableAttributedString(string: presenter.model.firstStep )
    }
    
    func setupSecondStepLabel() {
        contentView.addArrangedSubview(secondStepLabel)
        secondStepLabel.backgroundColor = .white
        secondStepLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        secondStepLabel.font = UIFont(name: "Rubik-Medium", size: 17)
        secondStepLabel.text = presenter.model.title4
    }
    
    func setupSecondStepInfoLabel() {
        contentView.addArrangedSubview(secondStepInfoLabel)
        secondStepInfoLabel.backgroundColor = .white
        secondStepInfoLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        secondStepInfoLabel.font = UIFont(name: "Rubik-Light", size: 14)
        secondStepInfoLabel.numberOfLines = 0
        secondStepInfoLabel.lineBreakMode = .byWordWrapping
        secondStepInfoLabel.attributedText = NSMutableAttributedString(string: presenter.model.secondStep )
    }
    
    func setupThirdStepLabel() {
        contentView.addArrangedSubview(thirdStepLabel)
        thirdStepLabel.backgroundColor = .white
        thirdStepLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        thirdStepLabel.font = UIFont(name: "Rubik-Medium", size: 17)
        thirdStepLabel.text = presenter.model.title5
    }
    
    func setupThirdStepInfoLabel() {
        contentView.addArrangedSubview(thirdStepInfoLabel)
        thirdStepInfoLabel.backgroundColor = .white
        thirdStepInfoLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        thirdStepInfoLabel.font = UIFont(name: "Rubik-Light", size: 14)
        thirdStepInfoLabel.numberOfLines = 0
        thirdStepInfoLabel.lineBreakMode = .byWordWrapping
        thirdStepInfoLabel.attributedText = NSMutableAttributedString(string: presenter.model.thirdStep )
    }
    
    func setupReturnMoney() {
        contentView.addArrangedSubview(returnMoney)
        returnMoney.backgroundColor = .white
        returnMoney.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        returnMoney.font = UIFont(name: "Rubik-Medium", size: 17)
        returnMoney.text = presenter.model.title6
    }
    
    func setupLocation() {
        var location = CLLocationCoordinate2D()
        location.longitude = CLLocationDegrees(presenter.model.lon)
        location.latitude = CLLocationDegrees(presenter.model.lat)
        contentView.addArrangedSubview(mapView)
        self.mapView.layer.cornerRadius = 28
        self.mapView.isZoomEnabled = true
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        self.mapView.addAnnotation(annotation)
        self.mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
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
    
    
}

