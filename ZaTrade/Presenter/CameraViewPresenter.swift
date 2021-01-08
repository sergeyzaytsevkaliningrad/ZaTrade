//
//  CameraViewPresenter.swift
//  ZaTrade
//
//  Created by Сергей Зайцев on 06.01.2021.
//

import Foundation
import UIKit
import Vision
import CoreML
import MobileCoreServices

final class CameraViewPresenter {
    weak var cameraViewController: CameraViewController?
    
    private var imageView = UIImageView()
    private var classificationRequest: VNCoreMLRequest!
    
    private let ifPriceFound = IfPriceFound()
    private let ifPriceNotFound = IfPriceNotFound()
    
    
    
    //Fist variant of using ML
     func predictImage() {
      do {
        let model = try VNCoreMLModel(for: PriceRecognizer().model)
        classificationRequest = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
          self?.processClassifications(for: request, error: error)
        })
       // classificationRequest.imageCropAndScaleOption = .centerCrop
      } catch { fatalError("Failed to load Vision ML model: \(error)") }
    }

    //Second variant of using ML
//  private func predictImage(_ image : UIImage) {
//
//        let model = PriceRecognizer().model
//        let vnModel = try! VNCoreMLModel(for: model)
//        let request = VNCoreMLRequest(model: vnModel) { (request, error) in
//
//            guard let result = request.results as? [VNClassificationObservation],
//                  let prediction = result.first else { return }
//
//        }
//        let hadler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
//        try! hadler.perform([request])
//
//
//
//    }
    
    
    //Have to think is I need it for ML
    //one of the copys
     func classify(image: UIImage) {
        let vnModel = try! VNCoreMLModel(for: PriceRecognizer().model)
        let request = VNCoreMLRequest(model: vnModel) { (request, error) in
            
                    guard let result = request.results as? [VNClassificationObservation],
                          let prediction = result.first else { return }
        }
//        let orientation = CGImagePropertyOrientation(rawValue: UInt32(image.imageOrientation.rawValue))
//      guard let ciImage = CIImage(image: image) else {
//        print("Unable to create a CIImage from UIImage")
//        return
//      }
        
        DispatchQueue.main.async {
            let hadler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
            try! hadler.perform([request])
        }
      }
    
    //also
     func processClassifications(for request: VNRequest, error: Error?) {
      DispatchQueue.main.async {
        guard let results = request.results else { return }
        
        // The `results` will always be `VNClassificationObservation`s, as specified by the Core ML model in this project.
        let classifications = results as! [VNClassificationObservation]
        if !classifications.isEmpty {
          let topClassifications = classifications[0]
          switch topClassifications.identifier {
          case "Price": self.ifPriceFound
          default: self.ifPriceNotFound
          }
        }
      }
    }
    
     func setupClassificationRequest() {
      do {
        let model = try VNCoreMLModel(for: PriceRecognizer().model)
        classificationRequest = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
          self?.processClassifications(for: request, error: error)
        })
        classificationRequest.imageCropAndScaleOption = .centerCrop
      } catch { fatalError("Failed to load Vision ML model: \(error)") }
    }
  }


public enum MediaPickerSource: String {
    case camera
    case library
    case documents
}
public enum MediaPickerType: String {
    case photos
}

public protocol MediaPickerDelegate: NSObjectProtocol {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any])
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
}

public class MediaPicker: NSObject {
    //Data
    var viewController: UIViewController? = nil
    var imagePicker: UIImagePickerController = UIImagePickerController()
  

    //Delegate
    public weak var delegate: MediaPickerDelegate? = nil

    public override init() {
        super.init()
    }

    public func showMediaPicker(from presentingViewController: UIViewController, type: MediaPickerType = .photos, sources: [MediaPickerSource] = [.camera, .library]) {
        //Set Data
        self.viewController = presentingViewController

        //Create Alert
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        //Add Camera Action
        if sources.contains(.camera) {
            let cameraAction: UIAlertAction = UIAlertAction(title: "Camera", style: .default) { (action) in
                self.presentCameraPicker(type: type)
            }
            cameraAction.setValue(UIImage(named: "gallery_picker_camera"), forKey: "image")
            cameraAction.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            alertController.addAction(cameraAction)
        }

        //Add Library Action
        if sources.contains(.library) {
            let libraryAction: UIAlertAction = UIAlertAction(title: "Library", style: .default) { (action) in
                self.presentLibraryPicker(type: type)
            }
            libraryAction.setValue(UIImage(named: "gallery_picker_library"), forKey: "image")
            libraryAction.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            alertController.addAction(libraryAction)
        }

        
        //Show Alert
        self.viewController?.present(alertController, animated: true, completion: nil)
    }

     func presentCameraPicker(type: MediaPickerType) {
        //Setup Types
        var pickerTypes: [String] = []
        switch type {
        case .photos:
            pickerTypes.append(kUTTypeImage as String)
            break
        }

        //Setup Picker
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = pickerTypes
        imagePicker.allowsEditing = true
        self.viewController?.present(imagePicker, animated: true, completion: nil)
    }

     func presentLibraryPicker(type: MediaPickerType) {
        //Setup Types
        var pickerTypes: [String] = []
        switch type {
        case .photos:
            pickerTypes.append(kUTTypeImage as String)
            break
        }

        //Setup Picker
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = pickerTypes
        imagePicker.allowsEditing = true
        self.viewController?.present(imagePicker, animated: true, completion: nil)
    }

//
}

extension MediaPicker: UIImagePickerControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        //Dismiss Picker Controller
        picker.dismiss(animated: true) {
            self.delegate?.imagePickerController(picker, didFinishPickingMediaWithInfo: info)
        }
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss Picker Controller
        picker.dismiss(animated: true) {
            self.delegate?.imagePickerControllerDidCancel(picker)
        }
    }
}

extension MediaPicker: UINavigationControllerDelegate {
    //Redundant delegate impleneted as part of UIImagePickerControllerDelegate
}

extension Bundle {
    public static var mainBundle: Bundle? {
        //Check Data
        guard let urlString = Bundle.main.path(forResource: "BSMediaPicker", ofType: "framework", inDirectory: "Frameworks") else {
            return nil
        }
        return Bundle(url: URL(fileURLWithPath: urlString))
    }
}
    //need to edit name CameraView
//extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    private func imagePickerController(_ picker: UIImagePickerController, didFinshPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
//        guard let image = info[.editedImage] as? UIImage else {return}
//        self.predictImage()
//        dismiss(animated: true){
//        self.showCamera()
//        }
//    }
//}

