//
//  TableCellViewController.swift
//  ZaTrade
//
//  Created by Сергей Зайцев on 09.11.2020.
//

import UIKit

class ItemTableCell: UITableViewCell {
    
    let imageIV = UIImageView()
    let nameLable = UILabel()
    let itemListLable = UILabel()
    var safeArea: UILayoutGuide!
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init(coder eDecoder: NSCoder) {
        fatalError("No init(coder)")
    }
    
    //MARK: - Cell Setup
    
    func setupView(){
        safeArea = layoutMarginsGuide
        setupImageView()
    }
    
    func setupImageView() {
        addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //imageIV.backgroundColor = .black
         imageIV.layer.cornerRadius = 10
        self.imageView?.image = UIImage(named: "za_label.png")
        
       
        
    }
    
    
}
