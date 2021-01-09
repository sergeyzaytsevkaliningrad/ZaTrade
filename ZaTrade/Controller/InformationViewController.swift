import UIKit
import WebKit

final class InformationViewController: CardViewController, WKUIDelegate {
    
    var presenter = InformationPresenter()
    var webView = WKWebView()
    var chooseItem = UIBarButtonItem()
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.navigationItem.rightBarButtonItem = self.chooseItem
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.parent?.navigationItem.rightBarButtonItem = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.presenter.currentArticleIndex = 0
        self.setup()
    }
    
    private func setup() {
        
        self.cardView.addSubview(webView)
        self.layoutNavigationItem()
        self.cardView.layoutSubviews()
        
    }
    
    private func layoutNavigationItem() {
        self.chooseItem = UIBarButtonItem(title: "Выбор статьи", style: .plain, target: self.presenter, action: #selector(self.presenter.choose))
        self.navigationItem.rightBarButtonItem = chooseItem
    }
    
    func ChooseItem() {
        let alert = UIAlertController(title: "Выбор статьи", message: nil, preferredStyle: .alert)
        alert.isModalInPopover = true
        
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(self.presenter.currentArticleIndex ?? -1, inComponent: 0, animated: false)
        
        alert.view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.widthAnchor.constraint(equalToConstant: 270).isActive = true
        pickerView.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 60).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -44).isActive = true
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Выбрать", style: .default, handler: { (action: UIAlertAction) in
            self.presenter.currentArticleIndex = pickerView.selectedRow(inComponent: 0)
        }))
        
        self.present(alert, animated: true)
    }

    private func setupConstraints() {
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        
        self.webView.topAnchor.constraint(equalTo: self.cardView.topAnchor, constant: 20).isActive = true
        self.webView.bottomAnchor.constraint(equalTo: self.cardView.bottomAnchor, constant: -20).isActive = true
        self.webView.leadingAnchor.constraint(equalTo: self.cardView.leadingAnchor, constant: 20).isActive = true
        self.webView.trailingAnchor.constraint(equalTo: self.cardView.trailingAnchor, constant: -20).isActive = true
    }
   
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
}

extension InformationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.presenter.articles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let article = self.presenter.articles[row].entity!
        return "\(article.tag!)"
    }
}
