//
//  CustomButtonPlus.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 16.10.2020.
//

import UIKit

class CustomButtonPlus: UIButton {
    
    let plus = UILabel()

    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        clear()
        self.backgroundColor = .white        
        self.layer.cornerRadius = 18
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 50).isActive = true
        heightAnchor.constraint(equalToConstant: 36).isActive = true   
    }
    
    private func clear() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    override func layoutSubviews() {
        plus.text = "+"
        let systemFontName = plus.font.fontName
        let fontSize = plus.font.pointSize * 1.8
        plus.font = UIFont.init(name: systemFontName, size: fontSize)
        plus.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        plus.textColor = .gray
        plus.textAlignment = .center
        plus.autoresizesSubviews = true
        plus.adjustsFontSizeToFitWidth = true
        plus.minimumScaleFactor = 0.2
        plus.numberOfLines = 0
        addSubview(plus)
    }
    
    
}

