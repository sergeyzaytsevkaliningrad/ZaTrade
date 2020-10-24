//
//  InfoCountryController.swift
//  ZaTrade
//
//  Created by Анастасия  on 17.10.2020.
//

import Foundation

final class InfoCountryController {
    
    let presenter = InfoCountryPresenter()
    let view = InfoCountryViewController()
    let model = InfoCountryModel(generalInfo: "", firstStep: "", secondStep: "" , thirdStep: "")
    
    
    func configure() -> InfoCountryController  {
        presenter.model = model
        presenter.view = view
        view.presenter =  presenter
        return self
    }
    
}

