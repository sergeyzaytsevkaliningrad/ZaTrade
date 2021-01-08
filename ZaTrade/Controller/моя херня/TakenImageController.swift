//
//  TakenImageController.swift
//  ZaTrade
//
//  Created by Сергей Зайцев on 06.01.2021.
//

import Foundation
import UIKit
import Vision

final class IfPriceFound: UIView {
   private let overlay = UIView()
    
   private let priceLable = UILabel()
   private let title = UILabel()
    
   private let foundPriceImage =  UIImageView(image: UIImage(named: "ZA_1"))
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        showFoundPrice()
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func showFoundPrice() {
     showOverlay()
     showFoundPriceImage()
     showFoundPirceTitele()
    }
    
    private func showOverlay(){
        addSubview(overlay)
        
        overlay.translatesAutoresizingMaskIntoConstraints = false
        let top = overlay.topAnchor.constraint(equalTo: topAnchor)
        let leading = overlay.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailing = overlay.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottom = overlay.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([top,leading,trailing,bottom])
        
        overlay.backgroundColor = .green
        overlay.layer.opacity = 0.8
    }
    
    private func showFoundPriceImage(){
        addSubview(foundPriceImage)
        
        foundPriceImage.translatesAutoresizingMaskIntoConstraints = false
        let top = foundPriceImage.topAnchor.constraint(equalTo: bottomAnchor )
        let height = foundPriceImage.heightAnchor.constraint(equalToConstant: 100)
        let width = foundPriceImage.widthAnchor.constraint(equalToConstant: 100)
        let CenterY = foundPriceImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        let CenterX = foundPriceImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        NSLayoutConstraint.activate([top, height, width, CenterY,CenterX])
    }
    
    private func showFoundPirceTitele() {
        addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        let top = title.topAnchor.constraint(equalTo: foundPriceImage.bottomAnchor)
        let CenterX = title.centerXAnchor.constraint(equalTo: centerXAnchor)
        NSLayoutConstraint.activate([top,CenterX])
        
        let attributes: [NSAttributedString.Key: Any] = [
            
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeWidth: -5.0,
            NSAttributedString.Key.font: UIFont(name: "Rubik-Light", size: 18)
          ]
          title.attributedText = NSAttributedString(string: "Your price", attributes: attributes)
        
        
    }
    
    
    
}

final class IfPriceNotFound: UIView {
    private let overlay = UIView()
     
    private let priceLable = UILabel()
    private let title = UILabel()
     
    private let foundPriceImage =  UIImageView(image: UIImage(named: "no_price"))
     
     
     
     override init(frame: CGRect){
         super.init(frame: frame)
         showFoundNotPrice()
     }
     
     required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
     }
     
     
     
     private func showFoundNotPrice() {
      showOverlay()
      showFoundPriceImage()
      showFoundPirceTitele()
     }
     
     private func showOverlay(){
         addSubview(overlay)
         
         overlay.translatesAutoresizingMaskIntoConstraints = false
         let top = overlay.topAnchor.constraint(equalTo: topAnchor)
         let leading = overlay.leadingAnchor.constraint(equalTo: leadingAnchor)
         let trailing = overlay.trailingAnchor.constraint(equalTo: trailingAnchor)
         let bottom = overlay.bottomAnchor.constraint(equalTo: bottomAnchor)
         NSLayoutConstraint.activate([top,leading,trailing,bottom])
         
         overlay.backgroundColor = .red
         overlay.layer.opacity = 0.8
     }
     
     private func showFoundPriceImage(){
         addSubview(foundPriceImage)
        
        foundPriceImage.translatesAutoresizingMaskIntoConstraints = false
        let top = foundPriceImage.topAnchor.constraint(equalTo: bottomAnchor )
        let height = foundPriceImage.heightAnchor.constraint(equalToConstant: 60)
        let width = foundPriceImage.widthAnchor.constraint(equalToConstant: 60)
        let CenterY = foundPriceImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        let CenterX = foundPriceImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        NSLayoutConstraint.activate([ top, height, width, CenterY,CenterX])
     }
     
     private func showFoundPirceTitele() {
         addSubview(title)
         
         title.translatesAutoresizingMaskIntoConstraints = false
         let top = title.topAnchor.constraint(equalTo: foundPriceImage.bottomAnchor)
         let centerX = title.centerXAnchor.constraint(equalTo: centerXAnchor)
         NSLayoutConstraint.activate([top,centerX])
         
         let attributes: [NSAttributedString.Key: Any] = [
             
             NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.strokeWidth: -5.0,
             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .light)
           ]
           title.attributedText = NSAttributedString(string: "Nothig found", attributes: attributes)
         
         
     }
     
     
     
 }


final class UIActivityIndicatorView: UIView {
    
   private let overlay = UIView()
   private let title = UILabel()
   private let loadingImage = UIImageView(image: UIImage(named: "ZA_1"))
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        showLoadingScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func showLoadingScreen() {
        setupLoadingImage()
        setupLoadingTitle()
        setupLoadingOverlay()
    }
    
    private func setupLoadingOverlay() {
        addSubview(overlay)
        
        overlay.translatesAutoresizingMaskIntoConstraints = false
        let top = overlay.topAnchor.constraint(equalTo: topAnchor)
        let leading = overlay.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailing = overlay.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottom = overlay.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([top,leading,trailing,bottom])
        
        overlay.backgroundColor = .white
        overlay.layer.opacity = 0.8
    }
    
    private func setupLoadingImage(){
        addSubview(loadingImage)
        
        loadingImage.translatesAutoresizingMaskIntoConstraints = false
        let centerX = loadingImage.centerXAnchor.constraint(equalTo: centerXAnchor )
        let centerY = loadingImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50)
        let width = loadingImage.widthAnchor.constraint(equalToConstant: 110)
        let hight = loadingImage.heightAnchor.constraint(equalTo: loadingImage.widthAnchor)
        NSLayoutConstraint.activate([centerX,centerY,width,hight])
        
        loadingImage.contentMode = .scaleAspectFit
    }
    
    private func setupLoadingTitle() {
      addSubview(title)
      
      title.translatesAutoresizingMaskIntoConstraints = false
      let centerX = title.centerXAnchor.constraint(equalTo: centerXAnchor)
      let top = title.topAnchor.constraint(equalTo: loadingImage.bottomAnchor, constant: 30)
      NSLayoutConstraint.activate([centerX, top])
      
      let attributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.strokeWidth: -5.0,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 35, weight: .light)
      ]
      title.attributedText = NSAttributedString(string: "Loading...", attributes: attributes)
    }
}
