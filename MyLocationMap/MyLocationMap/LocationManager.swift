//
//  LocationManager.swift
//  MyLocationMap
//
//  Created by GCCISAdmin on 10/24/23.
//

import Foundation
import CoreLocation
import SwiftUI

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var showAlert = false
    
    override init() {
        super.init()
        
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.requestWhenInUseAuthorization()
            }
        }
        locationManager.delegate = self
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .restricted:
            break
        case .denied:
            showAlert.toggle()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            return
        case .authorizedWhenInUse:
            return
        case .authorizedAlways:
            locationManager.allowsBackgroundLocationUpdates = true
            locationManager.pausesLocationUpdatesAutomatically = false
            return
        @unknown default:
            break
        }
    }
    
}
