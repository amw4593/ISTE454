import SwiftUI
import MapKit


struct ItemInfoView: View {
    
    var selectedResult: MKMapItem
    var route: MKRoute?
    
    
    @State private var lookaroundScene: MKLookAroundScene?
    
    private var travelTime: String? {
        guard let route else {return nil}
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: route.expectedTravelTime)
    }
    
    private func getLookAroundScene() {
        lookaroundScene = nil
        Task { //async task
            let request = MKLookAroundSceneRequest(mapItem: selectedResult)
            lookaroundScene = try? await request.scene
            
        }
    }
    
    var body: some View {

        LookAroundPreview(initialScene: lookaroundScene)
            .overlay(alignment: .bottomTrailing) {
                HStack {
                    
                    Text("\(selectedResult.name ?? "")")
                    if let travelTime {
                        Text(travelTime)
                    }
                    
                }//HStack
                .font(.caption)
                .foregroundStyle(.white)
                .padding(10)
            }//Overlay
            .onAppear {
                getLookAroundScene()
            }
            .onChange(of: selectedResult) {
                getLookAroundScene()
            }
        
    }
}

