import UIKit


class ProductListViewController: BaseViewController {
    private let topBottomMargin: CGFloat = 10
    
    var presenter = ProductListPresenter()
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }

}


extension ProductListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductViewCell
        cell.productName = "123"
        cell.countryFlag = "🇷🇺"
        cell.originalPrice = "12 000 p"
        cell.rublePrice = "12 000 p"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - (collectionView.layoutMargins.left + collectionView.layoutMargins.right), height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: topBottomMargin, left: 0, bottom: topBottomMargin, right: 0)
    }
    
}
