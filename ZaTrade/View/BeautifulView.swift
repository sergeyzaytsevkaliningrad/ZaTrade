//
//  BeautifulView.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 08.12.2020.
//

import UIKit

class BeautifulView: UIView {
    
    private let taxCount = UILabel()
    private let resultUSD = UILabel()
    private let resultRUB = UILabel()
    private let screenSize = UIScreen.main.bounds
    private let spacing: CGFloat = 20
    
    var USD: String = ""
    var RUB: String = ""
    var taxResult: String = ""
    
    init() {
        super.init(frame: .zero)
        self.addSubview(taxCount)
        self.addSubview(resultUSD)
        self.addSubview(resultRUB)
        
        setupConstraints()
        setupView()

    } 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView()  {
        self.backgroundColor = .white
        let shadowPath0 = UIBezierPath(roundedRect: self.bounds, cornerRadius: spacing)
        layer.shadowPath = shadowPath0.cgPath
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = spacing / 4
        layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.cornerRadius = spacing
        self.alpha = 0
        
        setuptaxCount()
        setupresultUSD()
        setupresultRUB()
    }
    
    
    func setupConstraints() {
        taxCount.translatesAutoresizingMaskIntoConstraints = false
        resultUSD.translatesAutoresizingMaskIntoConstraints = false
        resultRUB.translatesAutoresizingMaskIntoConstraints = false
        
        taxCount.topAnchor.constraint(equalTo: self.topAnchor, constant: spacing).isActive = true
        taxCount.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: spacing).isActive = true
        taxCount.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -spacing).isActive = true
        
        resultUSD.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: spacing).isActive = true
        resultUSD.topAnchor.constraint(equalTo: taxCount.bottomAnchor, constant: spacing).isActive = true
        resultUSD.heightAnchor.constraint(equalTo: taxCount.heightAnchor).isActive = true
        resultUSD.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        resultRUB.topAnchor.constraint(equalTo: resultUSD.bottomAnchor, constant: spacing).isActive = true
        resultRUB.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: spacing).isActive = true
        resultRUB.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -spacing).isActive = true
        resultRUB.heightAnchor.constraint(equalTo: resultUSD.heightAnchor).isActive = true
    }
    
    func setuptaxCount() {
        taxCount.text = "Размер налога: \(self.taxResult)"
        taxCount.textAlignment = .center
        taxCount.font = UIFont.systemFont(ofSize: 40)
        taxCount.lineBreakMode = .byWordWrapping
        taxCount.numberOfLines = 0
    }
    
    func setupresultUSD() {
        resultUSD.text = "Цена в валюте: \(self.USD)"
        resultUSD.textAlignment = .center
        resultUSD.font = UIFont.systemFont(ofSize: 60)
    }
    
    func setupresultRUB() {
        resultRUB.text = "Цена в рублях: \(RUB)"
        resultRUB.textAlignment = .center
        resultRUB.font = UIFont.systemFont(ofSize: 60)
    }
    
}
