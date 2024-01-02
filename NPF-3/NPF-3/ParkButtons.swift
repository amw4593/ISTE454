import SwiftUI
import MapKit


struct ParkButtons: View {
    
    @Binding var searchResults: [MKMapItem]
    @Binding var position: MapCameraPosition
    @Binding var parks: [Park]
    
    var visibleRegion: MKCoordinateRegion?
    
    
    func search(for query:String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }
    }
    
    var body: some View {
        HStack {

                Button {
                    
                    position = .automatic
                    
                } label: {
                    //pick valid name
                    Image(systemName: "trees")
                }
                .buttonStyle(.bordered)
            
            //put in segmented controller
            }//HStack
    }
}
