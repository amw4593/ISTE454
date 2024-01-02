import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var searchResults: [MKMapItem] = []
    @State private var position: MapCameraPosition = .automatic
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var selectedPark: Park?
    @State private var route: MKRoute?
    @State private var locationManager = LocationManager()
    @State var park = [Park]()
    
    var body: some View {
        VStack {
            Map(position: $position, selection: $selectedPark) {
                
                UserAnnotation()
                
                //put parks in here
                ForEach(park) { park in
                    let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: park.coordinate))
                    Marker(item: mapItem)
                }
                .annotationTitles(.hidden)
                
            }//Map
            .mapStyle(.imagery(elevation: .realistic))
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0){
                    if let selectedPark = selectedPark{
                        ItemInfoView(selectedResult: selectedPark, route: route)
                            .frame(height: 128)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding([.top, .horizontal])
                    }
                    //may only need park and position?
                    ParkButtons(searchResults: $searchResults, position: $position, parks: $park, visibleRegion: visibleRegion)
                        .padding([.top, .horizontal])
                }//VStack
                .background(.thinMaterial)
            }
            .onChange(of: selectedPark){
                getDirections()
            }
//            .onMapCameraChange {
//                context in visibleRegion = context.region
//            }
            .mapControls {
                MapUserLocationButton()
                MapCompass() //Pops up when map is beign rotated
                MapScaleView() //will only show when zooming in and out
            }
        }//VStack
            .padding()
        }//body
        
        func getDirections() {
            
            route = nil
            guard let selectedPark else { return }
            
            let request = MKDirections.Request()
            //use current location instead of .rit
            if let userLocation = locationManager.location {
                request.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation.coordinate))
            }
            //convert selectPark to MKMapItem
            //request.destination = selectedResult
            
            Task {
                let directions = MKDirections(request: request)
                let response = try? await directions.calculate()
                route = response?.routes.first
            }
            
        } //getDirections
    
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
