//
//  ConverterViewViewController.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 09.11.2020.
//

import UIKit

class ConverterViewController: UIViewController {
    
    private let textfield = UITextField()
    private let resultLabel = UILabel()
    private let swapButton = SwapButton()
    private let curentPicker = UIPickerView()
    private let toPicker = UIPickerView()
    private let convertButton = ConvertButton()
    
    var result: CGFloat = 0
    var input: CGFloat = 0
    
    private var presenter = ConverterPresenter()
    
    private let screenSize = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.presenter.view = self
        self.view.setupBackground()
        
        self.view.addSubview(textfield)
        self.layoutTextField()

        self.view.addSubview(swapButton)
        self.layoutSwapButton()
        
        self.view.addSubview(resultLabel)
        self.layoutResultLabel()
        
        self.view.addSubview(self.curentPicker)
        self.layoutCurrentPicker()
        
        self.view.addSubview(self.toPicker)
        self.layoutToPicker()
        
        self.view.addSubview(convertButton)
        self.layoutConvertButton()
    }
    
    func layoutTextField() {
        textfield.text = "\(input)"
        textfield.keyboardType = .numberPad
        textfield.textAlignment = .center
        textfield.layer.cornerRadius = 28
        textfield.layer.borderWidth = 1
        textfield.backgroundColor = .white

        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        textfield.trailingAnchor.constraint(equalTo: self.view.trailingAnchor , constant: -20).isActive = true
        textfield.heightAnchor.constraint(equalToConstant: self.screenSize.height * 0.25).isActive = true
        textfield.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
    
    func layoutResultLabel() {
        resultLabel.text = "\(result)"
        resultLabel.textAlignment = .center
        resultLabel.layer.cornerRadius = 28
        resultLabel.layer.borderWidth = 1
        resultLabel.layer.backgroundColor = UIColor.white.cgColor

        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.topAnchor.constraint(equalTo: self.swapButton.bottomAnchor, constant: 20).isActive = true
        resultLabel.heightAnchor.constraint(equalTo: self.textfield.heightAnchor).isActive = true
        resultLabel.widthAnchor.constraint(equalTo: self.textfield.widthAnchor).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func layoutSwapButton() {
        swapButton.addTarget(self, action: #selector(self.swap), for: .touchUpInside)

        swapButton.translatesAutoresizingMaskIntoConstraints = false
        swapButton.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 20).isActive = true
        swapButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        swapButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        swapButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func layoutCurrentPicker() {
        
        curentPicker.backgroundColor = .white
        curentPicker.layer.cornerRadius = 10
        
        curentPicker.translatesAutoresizingMaskIntoConstraints = false
        curentPicker.trailingAnchor.constraint(equalTo: swapButton.leadingAnchor, constant: -20).isActive = true
        curentPicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        curentPicker.heightAnchor.constraint(equalTo: swapButton.heightAnchor).isActive = true
        curentPicker.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 20).isActive = true
        
    }
    
    func layoutToPicker() {
        
        toPicker.backgroundColor = .white
        toPicker.layer.cornerRadius = 10
        
        toPicker.translatesAutoresizingMaskIntoConstraints = false
        toPicker.leadingAnchor.constraint(equalTo: swapButton.trailingAnchor , constant: 20).isActive = true
        toPicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        toPicker.heightAnchor.constraint(equalTo: swapButton.heightAnchor).isActive = true
        toPicker.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 20).isActive = true
        
    }
    
    func layoutConvertButton() {
        convertButton.addTarget(self, action: #selector(self.convert), for: .touchUpInside)
        
        convertButton.translatesAutoresizingMaskIntoConstraints = false
        convertButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20).isActive = true
        convertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        convertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        convertButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func swap(sender: SwapButton) {
        presenter.swap(sender: sender)
    }
    
    @objc func convert(sender: ConvertButton) {
        presenter.convert(sender: sender)
    }
}
