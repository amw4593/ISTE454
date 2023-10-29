
import Foundation
import CoreLocation
import SwiftUI

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var location: CLLocation? = nil
    var locationError = false
    var permissionsError = false
    
    override init() {
        super.init()
        
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.requestWhenInUseAuthorization()
            }
        }
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .restricted:
            permissionsError = true
            return
        case .denied:
            permissionsError = true
            return
        case .notDetermined:
            permissionsError = false
            return
        case .authorizedWhenInUse:
            permissionsError = false
            return
        case .authorizedAlways:
            permissionsError = false
            return
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationError = true
    }
    
}
