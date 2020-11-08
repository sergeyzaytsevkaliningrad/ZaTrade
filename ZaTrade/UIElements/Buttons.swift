import UIKit

final class ChooseCountryButton: UIView {
    
    private let lightGray = UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 0.32).cgColor
    private let lightGrayClicked = UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 0.5).cgColor
    private let garkGray = UIColor(red: 0.008, green: 0.008, blue: 0.008, alpha: 0.32).cgColor
    private let garkGrayClicked = UIColor(red: 0.008, green: 0.008, blue: 0.008, alpha: 0.5).cgColor
    
    private let flagView = UIView(frame: .zero)
    private let countryFlag =  UILabel(frame: .zero)
    private let countryTitle = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // setup elements
        self.layer.backgroundColor = self.lightGray
        self.layer.cornerRadius = 7
        
        flagView.layer.backgroundColor = self.garkGray
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.layer.backgroundColor = self.lightGrayClicked
        flagView.layer.backgroundColor = self.garkGrayClicked
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.layer.backgroundColor = self.lightGray
        flagView.layer.backgroundColor = self.garkGray
    }
    
}


final class UnderlineButton: UIButton {
    
    private let white = UIColor(red: 1, green: 1, blue: 1, alpha: 0.78)
    private let whiteClicked = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.78)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // setup elements
        self.titleLabel?.textColor = white
        self.titleLabel?.font = UIFont(name: "Rubik-Light", size: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        self.titleLabel?.attributedText = NSMutableAttributedString(string: self.titleLabel?.text ?? "", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.titleLabel?.textColor = whiteClicked
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.titleLabel?.textColor = white
    }
    
}
