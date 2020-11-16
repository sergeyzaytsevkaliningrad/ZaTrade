import UIKit


final class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
            
    override func layoutSubviews() {
        setupShadows()
    }
    
    private func setupShadows() {
        let shadowPath0 = UIBezierPath(roundedRect: self.bounds, cornerRadius: 28)
        layer.shadowPath = shadowPath0.cgPath
        layer.shadowColor = UIColor(red: 0.859, green: 0.278, blue: 0.71, alpha: 0.66).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 7
        layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.cornerRadius = 28
    }
    
}

