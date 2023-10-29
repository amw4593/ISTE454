
import Foundation
import CoreLocation
import SwiftUI

@Observable
class LocationManager: NSObject {
    
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    var locationError = false
    var permissionError = false
    var status: CLAuthorizationStatus = .notDetermined
    
    var location: CLLocation? = nil
    var placemark: CLPlacemark? = nil
    
    override init(){
        super.init()
        
            //setup location manager stuff
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //request permission
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.requestWhenInUseAuthorization()
            }
        }
        locationManager.startUpdatingLocation()
    }//init
    
    private func geocode(){
        //check for location
        guard let location = self.location else { return }
        
        geocoder.reverseGeocodeLocation(location) { places, error in
            if error == nil {
                self.placemark = places?[0]
            } else {
                self.placemark = nil
            }
        }//reverse geocoding
        
    }//geocode
    
    func getLocation (){
        locationManager.requestLocation()
    }
    
}//LocarionManage

extension LocationManager: CLLocationManagerDelegate {
    
    //gets called when current location is found
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //get the last location determined if it exists
        guard  let location = locations.last else { return }
        
        self.location = location //set our property above
        locationError = false //don't need to qualify that with self
        
        geocode()
    }
    
    //gets called with some type of error location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        locationError = true
    }
    
    //gets called anytime there is a change in authorization status
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.status = manager.authorizationStatus
        
        switch status {
        case .restricted:
            permissionError = true
            return
            
        case .denied:
            permissionError = true
            return
            
        case .notDetermined:
            permissionError = false
            return
            
        case .authorizedWhenInUse:
            permissionError = false
            return
            
        case .authorizedAlways:
            permissionError = false
            return
            
        @unknown default:
            break
        }
    }
        
}//extension
