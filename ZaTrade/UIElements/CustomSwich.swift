//
//  CustomSwich.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 16.10.2020.
//

import UIKit

final class CustomSwich: UIControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()

    }
    
    private var padding: CGFloat = 1
    private var onTintColor: UIColor = UIColor(red: 0.729, green: 0.553, blue: 0.82, alpha: 0.5)
    private var offTintColor: UIColor = UIColor(red: 0.729, green: 0.553, blue: 0.82, alpha: 0.5)
    private var thumbTintColor: UIColor = UIColor(red: 0.729, green: 0.553, blue: 0.82, alpha: 1)
    private var thumbCornerRadius: CGFloat = 3 
    private var thumbSize: CGSize = CGSize(width: 32, height: 23)
    
    private var thumbShadowColor: UIColor = UIColor.black 
    
    
    public var isOn: Bool = true 
    private var animationDuration: Double = 0.5
    
    fileprivate var thumbView = UIView(frame: .zero)
    fileprivate var onPoint = CGPoint.zero
    fileprivate var offPoint = CGPoint.zero
    fileprivate var isAnimating = false
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if !self.isAnimating {
            self.layer.cornerRadius = 3
            self.backgroundColor = self.isOn ? self.onTintColor : self.offTintColor
            
            let yPostition = (self.bounds.size.height - thumbSize.height) / 2
            
            self.onPoint = CGPoint(x: self.bounds.size.width - thumbSize.width - self.padding, y: yPostition)
            self.offPoint = CGPoint(x: self.padding, y: yPostition)
            
            self.thumbView.frame = CGRect(origin: self.isOn ? self.onPoint : self.offPoint, size: thumbSize)
            
        }
    }
    
    private func clear() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    private func setupUI() {
        self.clear()
        self.clipsToBounds = false
        self.thumbView.backgroundColor = self.thumbTintColor
        self.thumbView.isUserInteractionEnabled = false
        self.thumbView.layer.cornerRadius = thumbCornerRadius
        self.addSubview(self.thumbView)
    }
    
    private func animate() {
        self.isOn = !self.isOn
        self.isAnimating = true
        UIView.animate(withDuration: self.animationDuration, delay: 0, usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5, options: [UIView.AnimationOptions.curveEaseOut,
                                                             UIView.AnimationOptions.beginFromCurrentState], animations: {
                                                                self.thumbView.frame.origin.x = self.isOn ? self.onPoint.x : self.offPoint.x
                                                                self.backgroundColor = self.isOn ? self.onTintColor : self.offTintColor
                                                                
                                                             }, completion: { _ in
                                                                self.isAnimating = false
                                                                self.sendActions(for: UIControl.Event.valueChanged)
                                                             })
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        self.animate()
        return true
    }
    
    
}




