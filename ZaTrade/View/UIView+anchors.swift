//
//  UIView+anchors.swift
//  ZaTrade
//
//  Created by Сергей Зайцев on 06.11.2020.
//

import UIKit


//This helps to make fast layouts

extension UIView {
    
    //fills the view full
    func fillSuperview(padding: UIEdgeInsets) {
        anchor(top: superview?.topAnchor, leading:
                superview?.leadingAnchor, bottom:
                superview?.bottomAnchor,trailing:
                superview?.trailingAnchor, padding: padding, size: .zero)
    }
    
    func fillSuperview() {
        fillSuperview(padding: .zero)
    }
    
    //to regulate the anchor size
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    //All of the anchors Layout in function
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize ){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing,constant: padding.right).isActive = true
        }

        //didnt do anthing with size

        //needs to be completed with some code lines from https://www.youtube.com/watch?v=bd2KSWLXo3A&feature=youtu.be
     
        
    }
}
