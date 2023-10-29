//
//  ContentView.swift
//  MyLocationMap
//
//  Created by GCCISAdmin on 10/17/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var searchResults: [MKMapItem] = []
    @State private var position: MapCameraPosition = .automatic
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var selectedResult: MKMapItem?
    //@State private var selectedTag: Int?
    
    @State private var route: MKRoute?
    @State private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            Map(position: $position, selection: $selectedResult) {
                
                UserAnnotation()
                //Marker("RIT", coordinate: .rit)
                Annotation("RIT", coordinate: .rit){
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.background)
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.secondary, lineWidth: 5)
                        Image(systemName: "building.columns")
                            .padding(5)
                    }
                }
                .annotationTitles(.hidden)
                
                ForEach(searchResults, id: \.self) {
                    result in Marker(item: result)
                }
                .annotationTitles(.hidden)
                
                if let route {
                    MapPolyline(route)
                        .stroke(.blue, lineWidth: 5)
                }
                
//                Marker("U of R", systemImage: "car.fill", coordinate: CLLocationCoordinate2D(latitude: 43.1306, longitude: -77.6260))
//                
//                Marker("U of R", coordinate: CLLocationCoordinate2D(latitude: 43.1306, longitude: -77.6260))
//                    .tint(.blue)
//                    .tag(1)
            }
            .mapStyle(.imagery(elevation: .realistic))
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0){
                    if let selectedResult {
                        ItemInfoView(selectedResult: selectedResult, route: route)
                            .frame(height: 128)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding([.top, .horizontal])
                    }
                    RochesterButtons(searchResults: $searchResults, position: $position, visibleRegion: visibleRegion)
                        .padding([.top, .horizontal])
                                    }
                .background(.thinMaterial)
            }
            .onChange(of: searchResults){
                position = .automatic
            }
            
            .onChange(of: selectedResult){
                getDirections()
            }
            .onMapCameraChange {
                context in visibleRegion = context.region
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass() //Pops up when map is beign rotated
                MapScaleView() //will only show when zooming in and out
            }
        }
        .padding()
    }//body
    
    func getDirections() {
        
        route = nil
        guard let selectedResult else { return }
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: .rit))
        request.destination = selectedResult
        
        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
        
    }
    
}//ContentView

extension CLLocationCoordinate2D {
    static let rit = CLLocationCoordinate2D(latitude: 43.0839, longitude: -77.6747)
    
}

extension MKCoordinateRegion {
    static let rochester = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.0839, longitude: -77.6746), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1 ))
    
    static let ontarioShore = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.9598, longitude: -78.1652), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1 ))
}

#Preview {
    ContentView()
}
