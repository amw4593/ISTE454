//
//  ContentView.swift
//  Getter
//
//  Created by GCCISAdmin on 11/7/23.
//

import SwiftUI

struct DarkBlueShadowProgressViewStyle: 
    ProgressViewStyle {
    
    func makeBody(configuration: Configuration) -> some
    View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6), radius: 4, x: 1.0, y: 2.0)
    }
    
}

struct ContentView: View {
    
    @State private var dataModel = DataViewModel()
    
    private var urlString = "https://npservice.onrender.com/api/parks?type=json"
    var body: some View {
        GeometryReader { metrics in
            ZStack(alignment: .topTrailing){
                VStack {
                    
//                    ScrollView {
//                        Text(dataModel.data)
//                    }
                    if dataModel.data.isEmpty{
                        Text("No Parks Exist")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    } else {
                        
                        List(dataModel.data) { park in
                            ParkRow(park: park)
                        }
                        .listStyle(.plain)
                    }
                    Spacer()
                    
                    Button(action: {
                        dataModel.isDone = false
                        dataModel.fetch(urlString: urlString)
                    }, label: {
                        Text("Fetch")
                    })
                    .disabled(!dataModel.isDone)
                    
                    Text(dataModel.errorMessage)
                        .foregroundColor(.red)
                        .opacity(dataModel.error ? 1.0 : 0.0)
                }
                ProgressView()
                    .progressViewStyle(DarkBlueShadowProgressViewStyle())
                    .offset(x: metrics.size.width * -0.45, y: metrics.size.height * 0.5)
                    .opacity(dataModel.isDone ? 0 : 1)
            }
            
        }
    }
}

struct ParkRow: View {
    
    var park: ParkStruct
    
    var body: some View {
        
        LazyVStack(alignment: .leading, content: {
                Text("\(park.parkName)")
                    .font(.custom("Verdana", size: 20, relativeTo: .title3))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("\(park.state)")
                    .font(.title3)
            })
        
        
    }
    
}

#Preview {
    ContentView()
}
