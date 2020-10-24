import UIKit

class ViewController: UIViewController {

    let mainLabel = UILabel()
    let cView = CustomView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ViewController"
        self.view.backgroundColor = .white
        self.mainLabel.text = "ZaTrade"
        self.view.addSubview(self.mainLabel)
        self.view.addSubview(cView)
        self.setupConstraints()
    }

    func setupConstraints() {
        [
            self.mainLabel,
            self.cView,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            self.mainLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.mainLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            self.cView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ].forEach {
            $0.isActive = true
        }
    }

}


