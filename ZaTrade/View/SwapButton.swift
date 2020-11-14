import UIKit

class SwapButton: UIButton {

    
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
        self.setTitle("🔄", for: .normal)
        self.titleLabel?.frame = self.bounds
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
    }
    
}
