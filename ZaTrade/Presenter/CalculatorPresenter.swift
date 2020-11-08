//
//  CalculatorPresenter.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 30.10.2020.
//

import UIKit


protocol CalculatorPresenterProtocol: class {
    func buttonTapped(sender: UIButton) -> String
}

final class CalculatorPresenter: CalculatorPresenterProtocol {
    
    weak var view: CalculatorViewProtocol?
    
    func buttonTapped(sender: UIButton) -> String {
        var text: String = view?.titleText ?? "0"
        text += sender.titleLabel?.text ?? ""
        return text
    }
}


