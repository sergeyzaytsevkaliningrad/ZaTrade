//
//  CustomButtonPlus.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 16.10.2020.
//

import UIKit

class CustomButtonPlus: UIButton {
    
    let plus = UILabel()
    let shadows = UIView()
    let shapes = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    private func setup() {
        
        backgroundColor = .white
        layer.cornerRadius = 18
        plus.text = "+"
        plus.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        plus.textColor = .black
        plus.textAlignment = .center
        plus.autoresizesSubviews = true
        plus.adjustsFontSizeToFitWidth = true
        plus.minimumScaleFactor = 0.2
        plus.numberOfLines = 0
        addSubview(plus)
        
    }
}

