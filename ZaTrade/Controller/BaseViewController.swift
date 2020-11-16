import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addGradientLayer()
    }
    
    private func addGradientLayer() {
        let pinkColor = UIColor(red: 0.851, green: 0.122, blue: 0.663, alpha: 1).cgColor
        let purpleColor = UIColor(red: 0.851, green: 0.122, blue: 0.663, alpha: 1).cgColor
        let purpleLightColor = UIColor(red: 0.549, green: 0.184, blue: 0.733, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [pinkColor, purpleColor, purpleLightColor]
        gradientLayer.locations = [0, 0.42, 0.91]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = self.view.bounds
        self.view.layer.addSublayer(gradientLayer)
    }
    
}


class CardViewController: BaseViewController {
    
    let cardView = CardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.cardView)
        [
            self.cardView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.cardView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            self.cardView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.cardView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
        ].forEach( {$0.isActive = true } )
        
    }
        
}
