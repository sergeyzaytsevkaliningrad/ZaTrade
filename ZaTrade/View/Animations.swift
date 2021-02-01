//
//  Animations.swift
//  ZaTrade
//
//  Created by Константин on 30.01.2021.
//

import UIKit
import Foundation

extension UIView {
    func appearAnimation(withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = 1
        }
    }
    
    func disapearAnimation(withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = 0
        }
    }
}
