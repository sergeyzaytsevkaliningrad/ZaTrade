//
//  PoehaliButton.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 16.10.2020.
//

import UIKit

class PoehaliButton: UIButton {

    let label = UILabel()

    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor(red: 0.859, green: 0.278, blue: 0.71, alpha: 1)
        layer.cornerRadius = 14
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 270).isActive = true
        heightAnchor.constraint(equalToConstant: 47).isActive = true        
    }
    
    override func layoutSubviews() {
        
        label.frame.size = self.frame.size
        label.textColor = .white
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Rubik-Bold", size: 27)
        label.textAlignment = .center
        label.text = "Поехали!"
        self.addSubview(label)
    }
    
}
