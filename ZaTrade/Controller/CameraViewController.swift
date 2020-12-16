import UIKit
import Vision
import CoreML

final class CameraViewController: UIViewController {
    var safeArea: UILayoutGuide!
    
    private let ifPriceFound = IfPriceFound()
    private let ifPriceNotFound = IfPriceNotFound()
    private let loadingView = UIActivityIndicatorView()
    
    private var imageView = UIImageView()
    
    private var classificationRequest: VNCoreMLRequest!
    
    override func loadView() {
        
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        showCamera()
        showIfPriceFound()
        showIfPriceNotFound()
        
        showLoading()
        
    }

   
    
    private func showIfPriceFound(){
        view.addSubview(ifPriceFound)
        
        ifPriceFound.translatesAutoresizingMaskIntoConstraints = false
        let top = ifPriceFound.topAnchor.constraint(equalTo: view.topAnchor)
        let leading = ifPriceFound.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailing = ifPriceFound.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let height = ifPriceFound.heightAnchor.constraint(equalToConstant: -90)
        NSLayoutConstraint.activate([top, leading, trailing, height])
        
        ifPriceFound.isHidden = true
      }
    
    private func showIfPriceNotFound() {
      view.addSubview(ifPriceNotFound)
      
       ifPriceNotFound.translatesAutoresizingMaskIntoConstraints = false
       let bottom = ifPriceNotFound.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70)
       let leading = ifPriceNotFound.leadingAnchor.constraint(equalTo: view.leadingAnchor)
       let trailing = ifPriceNotFound.trailingAnchor.constraint(equalTo: view.trailingAnchor)
       let height = ifPriceNotFound.heightAnchor.constraint(equalToConstant: 150)
       NSLayoutConstraint.activate([bottom, leading, trailing, height])
      
       ifPriceNotFound.isHidden = true
    }
    
    private func showLoading() {
          view.addSubview(loadingView)
          
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        let top = loadingView.topAnchor.constraint(equalTo: view.topAnchor)
        let leading = loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let bottom = loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let trailing = loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        NSLayoutConstraint.activate([top, leading, bottom, trailing])
          
        loadingView.layer.opacity = 0
        }
    //MARK: - The start of addons&&func
    
    
    
    func showCamera() {
        let cameraVC = UIImagePickerController()
        cameraVC.sourceType = .camera
        cameraVC.allowsEditing = true
        cameraVC.delegate = self
        present(cameraVC, animated: true)
    }
    
    //Fist variant of using ML
    private func predictImage() {
      do {
        let model = try VNCoreMLModel(for: PriceRecognizer().model)
        classificationRequest = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
          self?.processClassifications(for: request, error: error)
        })
        classificationRequest.imageCropAndScaleOption = .centerCrop
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
    
    private func priceIsFound() {
        self.ifPriceFound.isHidden = false
        self.ifPriceNotFound.isHidden = true
    }
    
    private func priceIsNotFound() {
        self.ifPriceFound.isHidden = true
        self.ifPriceNotFound.isHidden = false
    }
    
    private func isLoading() {
        self.ifPriceFound.isHidden = true
        self.ifPriceNotFound.isHidden = true
        
        loadingView.layer.opacity = 2.0
    }
    
    private func isNotLoading() {
      self.loadingView.layer.opacity = 0
    }
    
    
    
    //Have to think is I need it for ML
    //one of the copys
    private func classify(image: UIImage) {
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
    private func processClassifications(for request: VNRequest, error: Error?) {
      DispatchQueue.main.async {
        guard let results = request.results else { return }
        
        // The `results` will always be `VNClassificationObservation`s, as specified by the Core ML model in this project.
        let classifications = results as! [VNClassificationObservation]
        if !classifications.isEmpty {
          let topClassifications = classifications[0]
          switch topClassifications.identifier {
          case "Price": self.priceIsFound()
          default: self.priceIsNotFound()
          }
        }
      }
    }
    
    private func setupClassificationRequest() {
      do {
        let model = try VNCoreMLModel(for: PriceRecognizer().model)
        classificationRequest = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
          self?.processClassifications(for: request, error: error)
        })
        classificationRequest.imageCropAndScaleOption = .centerCrop
      } catch { fatalError("Failed to load Vision ML model: \(error)") }
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

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true)
    
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      imageView.image = image
     
      isLoading()
     
    
      
      Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
        DispatchQueue.main.async { self.isNotLoading() }
        self.classify(image: image)
        self.priceIsNotFound()
      }
    }
  }
}


