import UIKit

final class ConverterPresenter {
    
    weak var view: ConverterViewController?
    private var course: CGFloat = 5.5
    
    func convert(sender: ConvertButton) {
        let input = view?.input ?? 0
        view?.result = input * course
        print("converted")
    }
    
    func swap(sender: SwapButton) {
        print("swap")
    }
}
