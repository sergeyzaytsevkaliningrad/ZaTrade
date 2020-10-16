import UIKit

class ViewController: UIViewController {
    
    let mainLabel = UILabel()
    let customview = CustomView(frame: CGRect(x: 0, y: 0, width: 335, height: 169))
    let customPlusButton = CustomButtonPlus(frame: CGRect(x: 0, y: 0, width: 50, height: 36))
    let customswich = CustomSwich()
    let poehali = PoehaliButton(frame: CGRect(x: (UIScreen.main.bounds.width - 270)/2, y: UIScreen.main.bounds.height/2, width: 270, height: 47))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ViewController"
        self.view.backgroundColor = .white
        
        self.mainLabel.text = "ZaTrade"
        self.customview.frame = CGRect(x: 100, y: 300, width: 335, height: 169)
        self.customswich.frame = CGRect(x: 100, y: 600, width: 64, height: 23)
        
        
        self.view.addSubview(self.mainLabel)
        self.view.addSubview(self.customview)
        self.view.addSubview(self.customswich)
        
        let vieW = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        vieW.backgroundColor = .black
        self.view.addSubview(vieW)
        vieW.addSubview(self.customPlusButton)
        
        
        self.setupConstraints()
    }

    func setupConstraints() {
        [
            self.mainLabel,
//            self.customview,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            self.mainLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.mainLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
//            self.customview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            self.customview.topAnchor.constraint(equalTo: self.mainLabel.bottomAnchor),

        ].forEach {
            $0.isActive = true
        }
    }
    
    override func viewDidLayoutSubviews() {

    }

}

