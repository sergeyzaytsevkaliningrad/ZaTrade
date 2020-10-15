import UIKit

class ViewController: UIViewController {
    
    let mainLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ViewController"
        self.view.backgroundColor = .white
        
        self.mainLabel.text = "ZaTrade"
        
        self.view.addSubview(self.mainLabel)
        
        self.setupConstraints()
    }

    func setupConstraints() {
        [
            self.mainLabel,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            self.mainLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.mainLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ].forEach {
            $0.isActive = true
        }
    }

}

