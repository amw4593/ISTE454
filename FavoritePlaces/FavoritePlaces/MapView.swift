//
//  MapView.swift
//  FavoritePlaces
//
//  Created by GCCISAdmin on 10/26/23.
//

import SwiftUI
import MapKit
import Foundation

struct MapView: View {
    
    @Binding var landmarks: [Landmark]
    
    @State private var selected: Landmark? = nil
    
    @State private var locationManager = LocationManager()
    
    var locationError: Bool { locationManager.locationError }
    var permissionsError: Bool { locationManager.permissionsError }
    
    var body: some View {
        Map(selection: $selected) {
            UserAnnotation()
            
            ForEach(landmarks, id: \.self) { landmark in //Marker(item: MKMapItem(placemark: MKPlacemark(coordinate: landmark.coordinate)))
//                Marker(landmark.title ?? "", systemImage: "figure.wave", coordinate: landmark.coordinate)
//                    .tint(.purple)
                Annotation(landmark.title ?? "", coordinate: landmark.coordinate) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.background)
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.secondary, lineWidth: 5)
                        Image(systemName: "flag.checkered.circle")
                            .padding(5)
                    }
                }
                
            }
                .annotationTitles(.hidden)
        }
        .safeAreaInset(edge: .bottom, content: {
            HStack {
                Spacer()
                
                
                VStack(spacing: 0) {
                    if let selected {
                        ItemInfoView(selected: selected)
                            .frame(height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding([.top, .horizontal])
                    }
                }
                Spacer()
            }
            .background(.thinMaterial)
        })
        .alert("Error Retrieving Location", isPresented: .constant(locationError)){}
    message: {
        Text("There was an error retrieving your location.")
    }
    .alert("Location Access Denied", isPresented: .constant(permissionsError)){
        Button("Ok", role: .cancel){
            
        }
        Button("Settings", role: .none){
            goToDeviceSettings()
        }
    }
message: {
    Text("Your location is needed.")
}
    }
}

extension MapView{
    func goToDeviceSettings() {
        guard let url = URL.init(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

