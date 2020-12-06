import Foundation


final class InformationPresenter {
    var view: InformationViewController?
    let articles: [EntityWrapper<Information>]
  
    var currentArticleIndex: Int? {
        didSet {
            if currentArticleIndex != nil {
                self.view?.chooseItem.title = articles[currentArticleIndex!].entity?.tag
//                print(" huy \(articles[currentArticleIndex!].entity?.tag)")
                let htmlCode = articles[currentArticleIndex!].entity?.info ?? "no info"
//                print(" pizda \(articles[currentArticleIndex!].entity?.info)")
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

