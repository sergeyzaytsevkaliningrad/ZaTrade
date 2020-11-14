//
//  CalculatorViewController.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 30.10.2020.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var titleText: String = "0"
    var presenter = CalculatorPresenter()
    
    private let VstackView = UIStackView()
    private let label = UILabel()
    private let screenSize = UIScreen.main.bounds
    
    private let names = [["AC", "+/-", "%", "/"], ["7", "8", "9", "*"],[ "4", "5", "6", "-"], ["1", "2", "3", "+"], ["0", ",", "=", "C"]]
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.setupBackground()
        
        presenter.view = self
        self.view.addSubview(VstackView)
        layoutBigStackView()
        
        self.view.addSubview(label)
    }
    
    // MARK: - LayoutFuncs
    
 
    
    func layoutLabel() {
        label.font = UIFont(name: "Rubik-Bold", size: 40)
        label.textColor = .white
        label.text = titleText
        label.textAlignment = .right
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: VstackView.topAnchor, constant: -10).isActive = true
        label.widthAnchor.constraint(equalToConstant: screenSize.width - 20).isActive = true
        label.heightAnchor.constraint(equalToConstant: ( screenSize.width - 5 * 10 ) / 4 ).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func layoutBigStackView() {
        
        VstackView.axis = NSLayoutConstraint.Axis.vertical
        VstackView.alignment = .center
        VstackView.spacing = 10
        
        let height = ( screenSize.width - 5 * VstackView.spacing ) / 4  * 5 + VstackView.spacing * 4
        
        VstackView.translatesAutoresizingMaskIntoConstraints = false
        VstackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        VstackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        VstackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        setupBigStackView()
    }
    
    func setupBigStackView() {
        for hstack in names {
            let stackView = UIStackView() 
            layoutStackView(stackView: stackView)
            for item in hstack {
                let button = UIButton()
                layoutButton(button: button, item: item)
                button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
                stackView.addArrangedSubview(button)
            }
            VstackView.addArrangedSubview(stackView)
        }
    }
    
    @objc func buttonTapped(sender: UIButton) {
        label.text = presenter.buttonTapped(sender: sender)
        titleText = presenter.buttonTapped(sender: sender)
        // TODO: peredelat vse na presentere
    }
    
    func layoutButton(button: UIButton, item: String) {
        let width = ( screenSize.width - 5 * 10 ) / 4 
        button.setTitle(item, for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Bold", size: 27)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: width).isActive = true
        button.heightAnchor.constraint(equalToConstant: width).isActive = true
        button.layer.cornerRadius = width / 2 
    }
    
    func layoutStackView(stackView: UIStackView) {
        let width = ( screenSize.width - 5 * 10 ) / 4 
        stackView.spacing = VstackView.spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.widthAnchor.constraint(equalToConstant: screenSize.width - VstackView.spacing * 2).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: width).isActive = true
        stackView.axis = NSLayoutConstraint.Axis.horizontal
    }
    
    override func viewDidLayoutSubviews() {
        layoutLabel()
    }
}
