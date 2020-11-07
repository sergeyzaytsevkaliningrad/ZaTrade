import UIKit

final class ChooseCountryButton: UIView {
    
    private let flagView = UIView(frame: .zero)
    private let countryFlag =  UILabel(frame: .zero)
    private let countryTitle = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // setup elements
        self.layer.backgroundColor = UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 0.32).cgColor
        self.layer.cornerRadius = 7
        
        flagView.layer.backgroundColor = UIColor(red: 0.008, green: 0.008, blue: 0.008, alpha: 0.31).cgColor
        flagView.layer.cornerRadius = 9
        
        countryFlag.text = "?"
        countryFlag.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        countryFlag.font = UIFont(name: "Sansation-Regular", size: 30)
        
        countryTitle.text = "countryTitle"
        countryTitle.textAlignment = .center
        countryTitle.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        countryTitle.font = UIFont(name: "Rubik-Regular", size: 17)
        
        // enable constraints
        let subviews = [flagView, countryFlag, countryTitle]
        subviews.forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
        
        // add subview
        self.addSubview(countryTitle)
        self.addSubview(flagView)
        flagView.addSubview(countryFlag)
        
        // setup constraints
        [
            self.widthAnchor.constraint(equalToConstant: 270),
            self.heightAnchor.constraint(equalToConstant: 44),
            
            flagView.widthAnchor.constraint(equalToConstant: 58),
            flagView.heightAnchor.constraint(equalToConstant: 44),
            flagView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            flagView.topAnchor.constraint(equalTo: self.topAnchor),
            
            countryFlag.widthAnchor.constraint(equalToConstant: 12),
            countryFlag.heightAnchor.constraint(equalToConstant: 23),
            countryFlag.centerXAnchor.constraint(equalTo: flagView.centerXAnchor, constant: 1),
            countryFlag.centerYAnchor.constraint(equalTo: flagView.centerYAnchor),
            
            countryTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            countryTitle.leadingAnchor.constraint(equalTo: flagView.trailingAnchor),
            countryTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
        ].forEach({ $0.isActive = true })
        // add gestures
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }*/
    
}
