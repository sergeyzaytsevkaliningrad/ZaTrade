//
//  UIView+Background.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 09.11.2020.
//

import UIKit

extension UIView {
    func setupBackground() {
        self.backgroundColor = .white
        let layer0 = CAGradientLayer()
        layer0.colors = [
            UIColor(red: 0.859, green: 0.278, blue: 0.71, alpha: 1).cgColor,
            UIColor(red: 0.62, green: 0.325, blue: 0.765, alpha: 1).cgColor ]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -0.02, b: 0.78, c: -0.78, d: 0, tx: 0.99, ty: -0.14))
        layer0.frame = self.bounds
        layer0.position = self.center
        self.layer.addSublayer(layer0)
    }
}
