import UIKit

class CustomButtonPlus: UIButton {
    
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

