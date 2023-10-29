//
//  ContentView.swift
//  CoreLocationExample
//
//  Created by GCCISAdmin on 10/12/23.
//

import Foundation
import CoreLocation
import SwiftUI

struct ContentView: View {
    
    var lm = LocationManager()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM, dd y, hh:mm a"
        //formatter.dateStyle = .full //built-in styles
        return formatter
    }
    
    var latitude: String { String(format : "%.4f",
                                  lm.location?.coordinate.latitude ?? 0) }
    var longitude: String { String(format : "%.4f",
                                  lm.location?.coordinate.longitude ?? 0) }
    var altitude: String { String(format : "%.4f",
                                  lm.location?.altitude ?? 0) }
    var hAccuracy: String { String(format : "%.4f",
                                  lm.location?.horizontalAccuracy ?? 0) }
    var vAccuracy: String { String(format : "%.4f",
                                  lm.location?.verticalAccuracy ?? 0) }
    var timestamp: String { dateFormatter.string(from:
                                  lm.location?.timestamp ?? Date()) }
    var speed: String { String(format : "%.4f",
                                  lm.location?.speed ?? 0) }
    var course: String { String(format : "%.4f",
                                  lm.location?.course ?? 0) }
    
    
    //with placemark you can get pieces of the description such as thoroughfare, locality
    var placemark: String { lm.placemark?.description ?? "XXX" }
    
    var status: CLAuthorizationStatus { lm.status }
    var locationError: Bool { lm.locationError }
    var permissionsError: Bool { lm.permissionError }
    
    
    
    var body: some View {
        //should have a button for this example to start and stop updating the location in this instance
        VStack (alignment: .leading, spacing: 5){
            Text("Latitude: \(latitude)")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                )
            Text("Longitude: \(longitude)")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                )
            Text("Altitude: \(altitude)")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                )
            Text("h.Accuracy: \(hAccuracy)")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                )
            Text("v.Accuracy: \(vAccuracy)")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                )
            Text("TimeStamp: \(timestamp)")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                )
            Text("Speed: \(speed)")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                )
            Text("Course: \(course)")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                )
            Text("Placemark: \(placemark)")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                )
        }
        .padding()
        .alert("Error Retrieving Location", isPresented: .constant(locationError)){
            
        } message: {
            Text("There was an error retrieving your location")
        }
        
        .alert("Location Access Denied", isPresented: .constant(permissionsError)){
            Button("OK", role: .cancel){
                
            }
            Button("Settings", role: .none){
                self.goToDeviceSettings()
            }
        } message: {
            Text("Your Location is Needed")
        }
        
    }//body
}//struct

extension ContentView {
    func goToDeviceSettings() {
        guard let url = URL.init(string: UIApplication.openSettingsURLString) else
        { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

#Preview {
    ContentView()
}
