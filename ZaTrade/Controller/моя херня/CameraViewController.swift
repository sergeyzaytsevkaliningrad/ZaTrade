import UIKit
import Vision
import CoreML

final class CameraViewController: UIViewController {
    var safeArea: UILayoutGuide!
    
    let cameraViewPresenter = CameraViewPresenter()
    
    private let ifPriceFound = IfPriceFound()
    private let ifPriceNotFound = IfPriceNotFound()
    
    //private let takenImage = TakenImageController()
    private let loadingView = UIActivityIndicatorView()
    
    private var imageView = UIImageView()
    
    private var classificationRequest: VNCoreMLRequest!
    
    private var mediaPicker = MediaPicker()
    
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
        mediaPicker.showMediaPicker(from: self)
//        let cameraVC = UIImagePickerController()
//        cameraVC.sourceType = .camera
//        cameraVC.allowsEditing = true
//        cameraVC.delegate = self
//        present(cameraVC, animated: true)

    }
    
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
}


extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true)
    
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      imageView.image = image
     
      isLoading()
     
    
      
      Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
        DispatchQueue.main.async { self.isNotLoading() }
        self.cameraViewPresenter.classify(image: image)
        self.priceIsNotFound()
      }
    }
  }
}
