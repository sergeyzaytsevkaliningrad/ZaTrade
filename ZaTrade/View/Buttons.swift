import UIKit

final class ChooseCountryButton: UIButton {
    
    private let lightGray = UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 0.32).cgColor
    private let lightGrayClicked = UIColor(red: 0.004, green: 0.004, blue: 0.004, alpha: 0.5).cgColor
    private let garkGray = UIColor(red: 0.008, green: 0.008, blue: 0.008, alpha: 0.32).cgColor
    private let garkGrayClicked = UIColor(red: 0.008, green: 0.008, blue: 0.008, alpha: 0.5).cgColor
    private let textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
    
    private let flagView = UIView(frame: .zero)
    let countryFlag =  UILabel(frame: .zero)
    let countryTitle = UILabel(frame: .zero)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // setup elements
        self.titleLabel?.isHidden = true
        self.layer.backgroundColor = self.lightGray
        self.layer.cornerRadius = 7
        
        flagView.layer.backgroundColor = self.garkGray
        flagView.layer.cornerRadius = 9
        
        countryFlag.textAlignment = .center
        countryFlag.textColor = textColor
        countryFlag.font = UIFont(name: "Sansation-Regular", size: 30)
        
        countryTitle.textAlignment = .center
        countryTitle.textColor = textColor
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
            
            countryFlag.leadingAnchor.constraint(equalTo: flagView.leadingAnchor),
            countryFlag.trailingAnchor.constraint(equalTo: flagView.trailingAnchor),
            countryFlag.topAnchor.constraint(equalTo: flagView.topAnchor),
            countryFlag.bottomAnchor.constraint(equalTo: flagView.bottomAnchor),
            
            countryTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            countryTitle.leadingAnchor.constraint(equalTo: flagView.trailingAnchor),
            countryTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
        ].forEach({ $0.isActive = true })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.layer.backgroundColor = self.lightGrayClicked
                flagView.layer.backgroundColor = self.garkGrayClicked
            } else {
                cancelTracking(with: nil)
                self.layer.backgroundColor = self.lightGray
                flagView.layer.backgroundColor = self.garkGray
            }
        }
    }

}


final class UnderlineButton: UIButton {
    
    private let white = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    private let whiteClicked = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.78)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // setup elements
        self.setTitleColor(white, for: .normal)
        self.setTitleColor(whiteClicked, for: .highlighted)
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
            
}

final class CustomButtonPlus: UIButton {
    
    let plus = UILabel()
    private let color = UIColor.white

    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        clear()
        self.backgroundColor = color
        self.layer.cornerRadius = 18
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 50).isActive = true
        heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    private func clear() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    override func layoutSubviews() {
        plus.text = "+"
        let systemFontName = plus.font.fontName
        let fontSize = UIFont.systemFontSize * 1.8
        plus.font = UIFont.init(name: systemFontName, size: fontSize)
        plus.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        plus.textColor = .gray
        plus.textAlignment = .center
        plus.autoresizesSubviews = true
        plus.adjustsFontSizeToFitWidth = true
        plus.minimumScaleFactor = 0.2
        plus.numberOfLines = 0
        addSubview(plus)
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                touchDown()
            } else {
                cancelTracking(with: nil)
                touchUp()
            }
        }
    }

    func touchDown() {
        layer.backgroundColor = color.withAlphaComponent(0.5).cgColor
        plus.textColor = UIColor.gray.withAlphaComponent(0.5)
    }

    func touchUp() {
        layer.backgroundColor = color.withAlphaComponent(1).cgColor
        plus.textColor = UIColor.gray.withAlphaComponent(1)
    }
    
}


final class LetsGoButton: UIButton {
    
    private var color = UIColor(red: 0.859, green: 0.278, blue: 0.71, alpha: 1)
    private let layer0 = CALayer()
    var text = "Поехали!"

    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = color
        layer.cornerRadius = 14
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 270).isActive = true
        heightAnchor.constraint(equalToConstant: 47).isActive = true
    }
    
    override func layoutSubviews() {
        self.setTitle(self.text, for: .normal)
        self.titleLabel?.frame.size = self.frame.size
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont(name: "Rubik-Bold", size: 27)
        self.titleLabel?.textAlignment = .center
    }
    
    override var isEnabled: Bool {
        didSet {
            setEnabled(isEnable: isEnabled)
        }
    }
    
    private func setEnabled(isEnable: Bool) {
        if isEnable {
            layer.backgroundColor = color.withAlphaComponent(1).cgColor
        } else {
            cancelTracking(with: nil)
            layer.backgroundColor = color.withAlphaComponent(0.5).cgColor
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                touchDown()
            } else {
                cancelTracking(with: nil)
                touchUp()
            }
        }
    }

    func touchDown() {
        layer.backgroundColor = color.withAlphaComponent(0.5).cgColor
        titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
    }

    func touchUp() {
        layer.backgroundColor = color.withAlphaComponent(1).cgColor
        titleLabel?.textColor = UIColor.white.withAlphaComponent(1)
    }
}


final class SwapButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        self.frame.size = CGSize(width: 40, height: 40)
        self.setImage(UIImage(systemName: "arrow.2.circlepath.circle"), for: .normal)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
    }
    
}

