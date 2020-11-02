//
//  CalculatorViewController.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 30.10.2020.
//

import UIKit

protocol CalculatorViewProtocol: class {
    var titleText: String { get set }
}

class CalculatorViewController: UIViewController, CalculatorViewProtocol {
    
    var titleText: String = "0"

    var presenter = CalculatorPresenter()
    
    private let VstackView = UIStackView()
    private let label = UILabel()
    private let screenSize = UIScreen.main.bounds
    
    private let names = [["AC", "+/-", "%", "/"], ["7", "8", "9", "*"],[ "4", "5", "6", "-"], ["1", "2", "3", "+"], ["0", ",", "=", "C"]]
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupBackground()
        
        self.view.backgroundColor = .systemPink
        presenter.view = self
        self.view.addSubview(VstackView)
        layoutBigStackView()
        
        self.view.addSubview(label)
    }
    
    // MARK: - LayoutFuncs
    
    func setupBackground() {
        view.backgroundColor = .white
        let layer0 = CAGradientLayer()
        layer0.colors = [
          UIColor(red: 0.859, green: 0.278, blue: 0.71, alpha: 1).cgColor,
          UIColor(red: 0.62, green: 0.325, blue: 0.765, alpha: 1).cgColor
        ]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -0.02, b: 0.78, c: -0.78, d: 0, tx: 0.99, ty: -0.14))
        layer0.frame = view.bounds
        layer0.position = view.center
        view.layer.addSublayer(layer0)
    }
    
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
        VstackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
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
