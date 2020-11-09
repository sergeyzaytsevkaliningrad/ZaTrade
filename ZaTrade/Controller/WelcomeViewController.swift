import UIKit

final class WelcomeViewController: UIViewController {
    
    let pinkColor = UIColor(red: 0.851, green: 0.122, blue: 0.663, alpha: 1).cgColor
    let purpleColor = UIColor(red: 0.851, green: 0.122, blue: 0.663, alpha: 1).cgColor
    let purpleLightColor = UIColor(red: 0.549, green: 0.184, blue: 0.733, alpha: 1).cgColor
    
    let mainImageView = UIImageView(image: UIImage(named: "za_label"))
    let chooseCountry = ChooseCountryButton() // modal with UIPickerView
    let letsGoButton = LetsGoButton()
    let taxFreeInfo = UnderlineButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [pinkColor, purpleColor, purpleLightColor]
        gradientLayer.locations = [0, 0.42, 0.91]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = self.view.bounds
        self.view.layer.addSublayer(gradientLayer)
        
        let subviews = [self.mainImageView, self.letsGoButton, self.chooseCountry, self.taxFreeInfo]
        
        // setup elements
        self.letsGoButton.setTitle("Поехали!", for: .normal)
        // self.chooseCountry.setTitle("Выберите вашу страну", for: .normal)
        self.taxFreeInfo.setTitle("Что такое Tax Free?", for: .normal)
        
        // enable constraints
        subviews.forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
        
        // add subview
        subviews.forEach({ self.view.addSubview($0) })
        
        self.setupConstraints()
    }
    
    func setupConstraints() {
        self.mainImageView.centerX()
        self.mainImageView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
                
        self.chooseCountry.centerX()
        self.chooseCountry.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100).isActive = true
        
        self.letsGoButton.centerX()
        self.letsGoButton.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 180).isActive = true
        
        self.taxFreeInfo.centerX()
        self.taxFreeInfo.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 260).isActive = true
    }
    
}
