import UIKit

final class CalculatorPresenter {
    
    weak var view: CalculatorViewController?
    
    func buttonTapped(sender: UIButton) -> String {
        var text: String = view?.titleText ?? "0"
        text += sender.titleLabel?.text ?? ""
        return text
    }
}


