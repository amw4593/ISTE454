//
//  ContentView.swift
//  LocationButtonExample
//
//  Created by GCCISAdmin on 10/17/23.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    var location: CLLocationCoordinate2D? = nil
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}

struct ContentView: View {
    
    @State private var locationManager = LocationManager()
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your Location \(location.latitude), \(location.longitude)")
            }
//            LocationButton(.currentLocation){
//                locationManager.requestLocation()
//            }
//            LocationButton(action:{})
//                .labelStyle(.iconOnly)
//                .symbolVariant(.fill)
            LocationButton(.currentLocation) {
                locationManager.requestLocation()
            }
            .frame(height: 44)
            .foregroundColor(.white)
            .cornerRadius(15.0)
            .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .tint(.green)
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
