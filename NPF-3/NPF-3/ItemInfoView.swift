import SwiftUI
import MapKit


struct ItemInfoView: View {
    
    var selectedResult: Park
    var route: MKRoute?
    
    private var travelTime: String? {
        guard let route else {return nil}
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: route.expectedTravelTime)
    }
    
    
    var body: some View {
        VStack {
                HStack {
                    
                    Text("\(selectedResult.getParkName())")
                    if let travelTime {
                        Text(travelTime)
                    }
                    
                }//HStack
                .font(.caption)
                .foregroundStyle(.white)
                .padding(10)
            }//Vstack
        
    }
}

