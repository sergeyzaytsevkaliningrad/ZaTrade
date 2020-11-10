//
//  TableViewController.swift
//  ZaTrade
//
//  Created by Сергей Зайцев on 07.11.2020.
//

import UIKit


class ItemTable: UIViewController {

    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    let itemList = ["MacBook","Trump","Iphone","Nothing"]
    

    override func viewDidLoad(){
        
        //Sets background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "Background_pink.png")
            self.view.insertSubview(backgroundImage, at: 0)
        
        
        safeArea = view.layoutMarginsGuide
        
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
        
        setupView()
    }
// MARK: - Setup view
    func setupView() {
        //ALWAY
        self.view.addSubview(tableView)
       
        
        
        //tableView.register(ItemCell.self, forCellReuseIdentifier: "cellid")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        view.layer.cornerRadius = 50
        
}

}

extension ItemTable: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
       
        let name = itemList[indexPath.row]
        cell.textLabel?.text = name
        
        return cell
        
       
        
    }
}

