//
//  TableViewController.swift
//  ZaTrade
//
//  Created by Сергей Зайцев on 07.11.2020.
//

import UIKit


class ProductListViewController: UIViewController {

    let tableView = UITableView()
    let itemList = ["MacBook","Trump","IPhone","Nothing","6","7","8"]
    let itemListLable = ["Sold","Vote","12 mini","Well still nothig"]
    var safeArea: UILayoutGuide!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        
        safeArea = view.layoutMarginsGuide
        
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
        
        setupView()
    }
// MARK: - Setup view
    func setupView() {
        //ALWAY
        self.view.addSubview(tableView)
       
        
        
        tableView.register(ItemTableCell.self, forCellReuseIdentifier: "cellid")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        tableView.layer.cornerRadius = 28
        
        
}
    
    
    

}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let name = itemList[indexPath.row]
        
       // ItemTableCell.itemListLable.nameLable.text = name
        cell.textLabel?.text = name
        cell.textLabel?.font = UIFont(name: "Rubik-Lighr", size: 20)
        
        return cell
    }
    
    func setupBackground() {
        view.backgroundColor = .white
        let layer0 = CAGradientLayer()
        layer0.colors = [
          UIColor(red: 0.859, green: 0.278, blue: 0.71, alpha: 1).cgColor,
          UIColor(red: 0.62, green: 0.325, blue: 0.765, alpha: 1).cgColor
        ]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -0.02, b: 0.78, c: -0.78, d: 0, tx: 0.99, ty: -0.14))
        layer0.frame = view.bounds
        layer0.position = view.center
        view.layer.addSublayer(layer0)
    }
    
    
    
}

