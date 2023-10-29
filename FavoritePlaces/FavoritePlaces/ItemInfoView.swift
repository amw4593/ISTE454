
import SwiftUI
import MapKit


struct ItemInfoView: View {
    
    var selected: Landmark
    
    var body: some View {

        VStack {
            
            Text("\(selected.title ?? "")")
                .font(.title2)
                .fontWeight(.bold)
            Text("\(selected.subtitle ?? "")")
                .font(.title3)
        }
        
    }
}
