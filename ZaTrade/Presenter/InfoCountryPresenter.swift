//
//  InfoCountryPresenter.swift
//  ZaTrade
//
//  Created by Анастасия  on 17.10.2020.
//

import Foundation

protocol InfoCountryPresenterProtocol: class {
    var view : InfoCountryViewProtocol? {get set}
    var model: InfoCountryModel? { get set }
}

final class InfoCountryPresenter: InfoCountryPresenterProtocol {
    
    var view : InfoCountryViewProtocol?
    var model: InfoCountryModel?
    
}

