//
//  CustomView.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 16.10.2020.
//

import UIKit

final class CustomView : UIView {
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        clear()
        self.backgroundColor = .white        
    }
    
    private func steupShadows() {
        let shadowPath0 = UIBezierPath(roundedRect: self.bounds, cornerRadius: 28)
        layer.shadowPath = shadowPath0.cgPath
        layer.shadowColor = UIColor(red: 0.859, green: 0.278, blue: 0.71, alpha: 0.66).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 7
        layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.cornerRadius = 28
    }
    
    private func clear() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    override func layoutSubviews() {
        steupShadows()
    }
}
