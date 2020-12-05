////
////  CameraView.swift
////  ZaTrade
////
////  Created by Сергей Зайцев on 05.12.2020.
////
//
//import UIKit
//import Vision
//
//func showCamera() {
//    let cameraVC: UIImagePickerController = UIImagePickerController()
//    cameraVC.sourceType = .camera
//    cameraVC.allowsEditing = true
//    cameraVC.delegate = self
//    present(cameraVC, animated = true)
//}
//
//
//func predictImage(_ image : UIImage){
//    let model = PriceRecognizer().model
//    
//    let vnModel = try! VNCoreMLModel(for: model)
//    
//    let request = VNCoreMLModel(model: vnModel) {(request, error) in
//        
//        guard let results.results as? [VNClassificationObservtion],
//              let prediction = result.first else {return}
//        
//        print(prediction.identifier, prediction.confedense*100,"%")
//    }
//
//    
//    
//}
//
////need to edit name CameraView
//extension CameraView: UIImagePickerControllerDelegate, UIImagePickerControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinshPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
//        guard let image = info[.editedImage] as? UIImage else {return}
//        self.predictImage(image)
//        dismiss(animated: true)
//        self.showCamera()
//    }
//}
