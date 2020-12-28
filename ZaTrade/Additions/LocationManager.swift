import MapKit
import CoreLocation

class LocationManageR: CLLocationManager, CLLocationManagerDelegate {
    
    //   let manager = LocationManageR()
    //   let country = manager.country()  how to use location manager
    
    private var result : String = ""
    
    override init() {
        super.init()
        setupManager()
        print("init")
    }
    
    func setupManager() {
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
                self.result = country
            print("getLocation: \(country)")
            }
    }
    
    func country() -> String {
        self.stopUpdatingLocation()
        return self.result
    }
}
