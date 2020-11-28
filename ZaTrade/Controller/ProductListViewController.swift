import UIKit


class ProductListViewController: BaseViewController {

    let tableView = UITableView()
    let itemList = ["MacBook","Trump","IPhone","Nothing","6","7","8"]
    let itemListLable = ["Sold","Vote","12 mini","Well still nothig"]
    var safeArea: UILayoutGuide!

    override func viewDidLoad() {
        super.viewDidLoad()
                
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
}

