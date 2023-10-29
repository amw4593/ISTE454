//
//  RochesterButtons.swift
//  MyLocationMap
//
//  Created by GCCISAdmin on 10/19/23.
//

import SwiftUI
import MapKit


struct RochesterButtons: View {
    
    @Binding var searchResults: [MKMapItem]
    @Binding var position: MapCameraPosition
    
    
    var visibleRegion: MKCoordinateRegion?
    
    
    func search(for query:String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = visibleRegion ?? MKCoordinateRegion(center: .rit, span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }
    }
    
    var body: some View {
        HStack {
            
            Button {
                search(for: "playground")
            } label: {
                Label("Playgrounds", systemImage: "figure.and.child.holdinghands")
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                search(for: "beaches")
            } label: {
                Label("Beaches", systemImage: "beach.umbrella")
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                position = .region(.rochester)
            } label: {
                Label("Rochetser", systemImage: "building.2")
            }
            .buttonStyle(.bordered)
            
            Button {
                position = .region(.ontarioShore)
            } label: {
                Label("Ontario Shore", systemImage: "water.waves")
            }
            .buttonStyle(.bordered)
            
            Button {
                //Camera Position with an exact MaCamera Configuration
                position = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 43.0839, longitude: -77.6746), distance: 980, heading: 242, pitch: 60))
                
            } label: {
                Label("RIT", systemImage: "building.columns.circle")
            }
            .buttonStyle(.bordered)
            
            Button {
                position = .userLocation(fallback: .automatic)
            } label: {
                Label("Home", systemImage: "house")
            }
            .buttonStyle(.bordered)
        }
        
        .labelStyle(.iconOnly)
    }
}
