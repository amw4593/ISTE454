//
//  ContentView.swift
//  FavoritePlaces
//
//  Created by GCCISAdmin on 10/26/23.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    @State private var landmarks: [Landmark] = []
    
    init () {
        
        if let path = Bundle.main.path(forResource: "landmarks", ofType: "plist") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let tempDict = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String:Any]
                
                print(tempDict)
                
                let tempArray = tempDict["landmarks"]! as! Array<[String:Any]>
                
                var tempLandmarks: [Landmark] = []
                
                for dict in tempArray {
                    
                    print(dict)
                    let name = dict["name"] as? String ?? "NA"
                    let state = dict["state"] as? String ?? "NA"
                    let latitude = dict["latitude"] as? Double ?? 0.0
                    let longitude = dict["longitude"] as? Double ?? 0.0
                    
                    let location = CLLocation(latitude: latitude, longitude: longitude)
                    let lm = Landmark(name: name, state: state, location: location)
                    
                    tempLandmarks.append(lm)
                    
                }
                
                print("There are \(tempLandmarks.count) landmarks")
                print(tempLandmarks)
                
                //assign to state variable
                _landmarks = State(initialValue: tempLandmarks)
                
            } catch {
                print(error)
            }
        }
        
    }
    
    var body: some View {
        MapView(landmarks: $landmarks)
    }
}

#Preview {
    ContentView()
}
