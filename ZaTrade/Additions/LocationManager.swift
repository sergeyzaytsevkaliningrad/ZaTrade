import MapKit
import CoreLocation

final class LocationManageR: CLLocationManager, CLLocationManagerDelegate {
    //   how to use location manager:
    //   let country: String = LocationManageR.shared.country
    
    var country : String? {
        didSet {
            self.stopUpdatingLocation()
        }
    }   
    static let shared = LocationManageR()
    
    private override init() {
        super.init()
        setupManager()
    }
    
    private func setupManager() {
        self.requestAlwaysAuthorization()
        self.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            self.delegate = self
            self.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.startUpdatingLocation()
        }
    }
    
    private func fetchCityAndCountry(from location: CLLocation, completion: @escaping ( _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.country, error)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = manager.location else { return }
        fetchCityAndCountry(from: location) { country, error in
            guard let country = country, error == nil else { return }
                self.country = country
            }
    }
}
