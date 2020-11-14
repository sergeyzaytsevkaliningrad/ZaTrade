import UIKit

final class WelcomeViewController: BaseViewController {
    
    var presenter = WelcomePresenter()
    
    let mainImageView = UIImageView(image: UIImage(named: "za_label"))
    let chooseCountry = ChooseCountryButton() // modal with UIPickerView
    let letsGoButton = LetsGoButton()
    let taxFreeInfo = UnderlineButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Главная"
        
        self.presenter.viewController = self
        
        let subviews = [self.mainImageView, self.letsGoButton, self.chooseCountry, self.taxFreeInfo]
        
        // setup elements
        self.letsGoButton.setTitle("Поехали!", for: .normal)
        self.letsGoButton.addGestureRecognizer(UITapGestureRecognizer(target: self.presenter, action: #selector(self.presenter.openTabBarController)))
        self.taxFreeInfo.setTitle("Что такое Tax Free?", for: .normal)
        
        // enable constraints
        subviews.forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
        
        // add subview
        subviews.forEach({ self.view.addSubview($0) })
        
        self.setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setupConstraints() {
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
