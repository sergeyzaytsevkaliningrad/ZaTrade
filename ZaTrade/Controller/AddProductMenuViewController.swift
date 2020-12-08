import UIKit


final class AddProductMenuViewController: UIViewController {
    let presenter = AddProductMenuPresenter()
    weak var mainNavigationController: UINavigationController?
    
    private let addUsingCamera = UIButton(type: .system)
    private let addUsingInput = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.viewController = self
        self.view.backgroundColor = .white
        
        addUsingInput.setTitle("Вручную", for: .normal)
        addUsingInput.addTarget(self.presenter, action: #selector(self.presenter.addUsingInput), for: .touchUpInside)
        
        addUsingCamera.setTitle("Из камеры", for: .normal)
        addUsingCamera.addTarget(self.presenter, action: #selector(self.presenter.addUsingCamera), for: .touchUpInside)
        
        [addUsingCamera, addUsingInput].forEach({ $0.translatesAutoresizingMaskIntoConstraints = false; self.view.addSubview($0)})
        
        [
            addUsingCamera.topAnchor.constraint(equalTo: self.view.topAnchor),
            addUsingCamera.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            addUsingCamera.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
            
            addUsingInput.topAnchor.constraint(equalTo: addUsingCamera.bottomAnchor),
            addUsingInput.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            addUsingInput.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
        ].forEach({ $0.isActive = true })
        
    }
}
