import Foundation


final class InformationPresenter {
    var view: InformationViewController?
    let articles: [EntityWrapper<Information>]
  
    var currentArticleIndex: Int? {
        didSet {
            if currentArticleIndex != nil {
                self.view?.chooseItem.title = articles[currentArticleIndex!].entity?.tag
                let htmlCode = articles[currentArticleIndex!].entity?.info ?? "No information"
                self.view?.webView.loadHTMLString(htmlCode, baseURL: nil)
            }
        }
    }
    
    init() {
        self.articles = EntityWrapper<Information>.all()
    }
    
    @objc func choose() {
        self.view?.ChooseItem()
    }
}

