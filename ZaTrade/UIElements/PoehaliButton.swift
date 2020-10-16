//
//  PoehaliButton.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 16.10.2020.
//

import UIKit

class PoehaliButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {

        print(2)
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 186.13, height: 40)
        label.backgroundColor = .white
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Rubik-Bold", size: 27)
        // Line height: 32 pt
        label.textAlignment = .center
        label.text = "Поехали!"
        let parent = self
        parent.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 186.13).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 94).isActive = true
        label.topAnchor.constraint(equalTo: parent.topAnchor, constant: 593).isActive = true

        frame = CGRect(x: 0, y: 0, width: 270, height: 47)
        backgroundColor = UIColor(red: 0.859, green: 0.278, blue: 0.71, alpha: 1)
        layer.cornerRadius = 14
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 270).isActive = true
        heightAnchor.constraint(equalToConstant: 47).isActive = true        
        
    }

}
