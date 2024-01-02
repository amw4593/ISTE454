
import SwiftUI
import MapKit
import Foundation

struct MapView: View {
    
    @Binding var parks: [Park]
    
    @State private var selected: Park? = nil
    @State private var position: MapCameraPosition = .automatic
    @State private var mapStyle: MapStyle = .standard
    @State private var locationManager = LocationManager()
    
    @State private var route: MKRoute?
    
    var locationError: Bool { locationManager.locationError }
    var permissionsError: Bool { locationManager.permissionsError }
    
    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))) { park in
            Marker(item: parks)
                .annotationTitles(.hidden)
            }//Map
            .mapStyle(mapStyle)
            .safeAreaInset(edge: .bottom, content: {
                HStack {
                    Spacer()
                    
                    
                    VStack(spacing: 0) {
                        if let selected {
                            ItemInfoView(selectedResult: selected, route: route)
                                .frame(height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding([.top, .horizontal])
                        }
                    }
                    Spacer()
                }
                .background(.thinMaterial)
            })
            
        }//body
        
        
        func goToDeviceSettings() {
            guard let url = URL.init(string: UIApplication.openSettingsURLString) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
}
