//
//  TakenImagePresenter.swift
//  ZaTrade
//
//  Created by Сергей Зайцев on 06.01.2021.
//

import Foundation
import UIKit
import Photos


final class TakenImagePresenter {
 //  weak var takenImagePresenter: TakenImageController?
    var isAuthorized: Bool {
        return PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized
    }
    
    var isDenied: Bool {
        return PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.denied
    }
    
    func request(completion: @escaping ()->()?) {
        PHPhotoLibrary.requestAuthorization({
            finished in
            DispatchQueue.main.async {
                completion()
            }
        })
    }
}
