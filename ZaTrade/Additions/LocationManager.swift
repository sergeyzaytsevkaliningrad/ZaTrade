//
//  LocationManager.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 20.11.2020.
//
import MapKit
import CoreLocation

class LocationManager: CLLocationManager, CLLocationManagerDelegate {
    
    private var result : String = ""
    
    func setupManager() {
        self.requestAlwaysAuthorization()
        self.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            self.delegate = self
            self.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.startUpdatingLocation()
        }
    }
    
    func fetchCityAndCountry(from location: CLLocation, completion: @escaping ( _ country:  String?, _ error: Error?) -> ()) {
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
        setupManager()
        return self.result
    }
}
