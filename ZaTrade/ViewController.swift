import UIKit

class ViewController: UIViewController {

    let mainLabel = UILabel()
    let cView = CustomView()
    let customview = CustomView()
    let customPlusButton = CustomButtonPlus()
    let customswich = CustomSwich()
    let poehali = PoehaliButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ViewController"
        self.view.backgroundColor = .white
        self.mainLabel.text = "ZaTrade"

        self.view.addSubview(self.poehali)
        self.view.addSubview(self.mainLabel)
        self.view.addSubview(self.mainLabel)
        self.view.addSubview(cView)

        self.view.addSubview(self.poehali)
        self.view.addSubview(self.mainLabel)
        self.view.addSubview(self.customview)
        self.view.addSubview(self.customswich)
        
        self.view.addSubview(self.customPlusButton)
        self.view.backgroundColor = .gray
        
        
        self.setupConstraints()
    }

    func setupConstraints() {
        [
            self.customPlusButton,
            self.mainLabel,
            self.cView,
            self.customview,
            self.customswich,
            self.poehali
            
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            self.customPlusButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.customPlusButton.bottomAnchor.constraint(equalTo: self.customview.topAnchor, constant: -50),

            
            self.mainLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.mainLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            self.cView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.customview.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.customview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.customview.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            self.customview.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3),
            
            self.poehali.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.poehali.topAnchor.constraint(equalTo: self.customview.bottomAnchor, constant: 50),
            
            self.customswich.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.customswich.topAnchor.constraint(equalTo: self.poehali.bottomAnchor, constant: 50),

        ].forEach {
            $0.isActive = true
        }
    }
    

}


