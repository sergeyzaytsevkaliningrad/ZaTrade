import UIKit


final class ProductListViewController: BaseViewController {
    private let topBottomMargin: CGFloat = 10
    
    var presenter = ProductListPresenter()
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var buttonPlus = CustomButtonPlus()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.viewController = self
        
        self.collectionView.layoutMargins = UIEdgeInsets(top: topBottomMargin, left: 10, bottom: topBottomMargin, right: 10)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(ProductViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.view.addSubview(self.collectionView)
        
        self.collectionView.backgroundColor = UIColor(white: 1, alpha: 0)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        buttonPlus.addTarget(self.presenter, action: #selector(self.presenter.showPopover), for: .touchUpInside)
        self.view.addSubview(buttonPlus)
        
        buttonPlus.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        buttonPlus.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.presenter.reloadData()
    }

}


extension ProductListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.products.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductViewCell
        let product = self.presenter.products[indexPath.row]
        cell.productName = product.entity!.name!
        cell.countryFlag = product.entity!.country!.flag!
        cell.originalPrice = product.entity!.formattedPrice
        cell.rublePrice = product.entity!.formattedRubPrice
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.showProduct(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - (collectionView.layoutMargins.left + collectionView.layoutMargins.right), height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: topBottomMargin, left: 0, bottom: topBottomMargin, right: 0)
    }
    
}


extension ProductListViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
