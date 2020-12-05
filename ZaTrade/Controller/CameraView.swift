//
//  CameraView.swift
//  ZaTrade
//
//  Created by Сергей Зайцев on 05.12.2020.

import UIKit
import Vision

class CameraView: UIViewController {
    
    override func loadView() {
        showCamera()
    }

    
    func showCamera() {
        let cameraVC: UIImagePickerController = UIImagePickerController()
        cameraVC.sourceType = .camera
        cameraVC.allowsEditing = true
        cameraVC.delegate = self
        present(cameraVC, animated: true)
    }
    
    
    func predictImage(_ image : UIImage){
        let model = PriceRecognizer().model
        
        let vnModel = try! VNCoreMLModel(for: model)
        
        let request = VNCoreMLRequest(model: vnModel) { (request, error) in
            
            guard let result = request.results as? [VNClassificationObservation],
                  let prediction = result.first else { return }
            
            print(prediction.identifier, prediction.confidence*100,"%")
        }
        let hadler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        try! hadler.perform([request])
        
    }
}
    //need to edit name CameraView
    extension CameraView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        func imagePickerController(_ picker: UIImagePickerController, didFinshPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
            guard let image = info[.editedImage] as? UIImage else {return}
            self.predictImage(image)
            dismiss(animated: true){
            self.showCamera()
        }
    }
    }


