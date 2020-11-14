import UIKit

class ConvertButton: UIButton {
    
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
        self.setTitle("Посчитать", for: .normal)
        self.titleLabel?.frame = self.bounds
        self.backgroundColor = .black
        self.layer.cornerRadius = 10
    }
    
}

