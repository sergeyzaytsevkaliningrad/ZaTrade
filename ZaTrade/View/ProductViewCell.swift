import UIKit

class ProductViewCell: UICollectionViewCell {
    
    var productName: String = "" {
        didSet {
            productNameLabel.text = productName
        }
    }
    var countryFlag: String = "" {
        didSet {
            countryFlagLabel.text = countryFlag
        }
    }
    var originalPrice: String = "" {
        didSet {
            originalPriceLabel.text = originalPrice
        }
    }
    var rublePrice: String = "" {
        didSet {
            rublePriceLabel.text = rublePrice
        }
    }
    
    private let cardView = CardView()
    private let productNameLabel = UILabel()
    private let countryFlagLabel = UILabel()
    private let originalPriceLabel = UILabel()
    private let rublePriceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(cardView)
        
        [
            countryFlagLabel,
            productNameLabel,
            originalPriceLabel,
            rublePriceLabel
            
        ].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false;
            cardView.addSubview($0)
        }
        
        productNameLabel.font = UIFont(name: "Rubik-Light", size: 20)
        originalPriceLabel.font = UIFont(name: "Rubik-Light", size: 14)
        rublePriceLabel.font = UIFont(name: "Rubik-Light", size: 14)
    }
    
    private func setupConstraints() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            cardView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            productNameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            productNameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 15),
            productNameLabel.trailingAnchor.constraint(equalTo: countryFlagLabel.leadingAnchor, constant: -10),
            
            
            countryFlagLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            countryFlagLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            
            
            originalPriceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 5),
            originalPriceLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 30),
            
            
            rublePriceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 5),
            rublePriceLabel.leadingAnchor.constraint(equalTo: originalPriceLabel.trailingAnchor, constant: 20),
            rublePriceLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -30),
            rublePriceLabel.widthAnchor.constraint(equalTo: originalPriceLabel.widthAnchor)
            
            
        ].forEach({ $0.isActive = true })
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
