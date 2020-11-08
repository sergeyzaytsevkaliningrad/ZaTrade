//
//  CustomView.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 16.10.2020.
//

import UIKit

final class CustomView : UIView {
    
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
    
    func setup() {
        
        backgroundColor = .white
        
        shadows.frame = frame
        shadows.clipsToBounds = false
        addSubview(shadows)
        
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 28)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0.859, green: 0.278, blue: 0.71, alpha: 0.66).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 7
        layer0.shadowOffset = CGSize(width: 0, height: 4)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)
        
        shapes.frame = frame
        shapes.clipsToBounds = true
        addSubview(shapes)
        
        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer1.bounds = shapes.bounds
        layer1.position = shapes.center
        shapes.layer.addSublayer(layer1)
        
        shapes.layer.cornerRadius = 28
        
    }
}

