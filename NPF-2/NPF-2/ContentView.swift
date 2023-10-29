//
//  ContentView.swift
//  NPF-2
//
//  Created by gccisadmin on 10/12/23.
//

import SwiftUI
import CoreLocation



struct ContentView: View {
    @State var parks: [Park] = []
    init() {
        //load data
        if let path = Bundle.main.path(forResource: "data", ofType: "plist") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let tempDict = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String:Any]
                let tempArray = tempDict["parks"] as! Array<[String:Any]>
                var tempParks: [Park] = []
                for dict in tempArray {
                    let parkName = dict["parkName"]! as! String
                    let parkLocation = dict["parkLocation"]! as! String
                    let latitude = Double(dict["latitude"]! as? Double ?? 0.0)
                    let longitude = Double(dict["longitude"]! as? Double ?? 0.0)
                    let location = CLLocation(latitude: latitude, longitude: longitude)
                    let area = dict["area"]! as! String
                    let link = dict["link"]! as! String
                    let dateFormed = dict["dateFormed"]! as! String
                    let description = dict["description"]! as! String
                    let imageName = dict["imageName"]! as! String
                    let imageLink = dict["imageLink"]! as! String
                    let imageSize = Double(dict["imageSize"]! as? Double ?? 0.0)
                    let imageType = dict["imageType"]! as! String
                    
                    // you get the rest of the values
                    // area, link,dateFormed, description. imageName, imageLink, imageSize, imageType
                    //you need to provide all of the values from the plist and possibly modify the initializer with any new values...
                    //may have to be changed to accept any additional properties
                    let p = Park(parkName: parkName, parkLocation: parkLocation, dateFormed: dateFormed, area: area, link: link, location: location, imageLink: imageLink, parkDescription: description, latitude: latitude, longitude: longitude, imageSize: imageSize, imageType: imageType)
                    tempParks.append(p)
                }//for
                //check to see if the parks were created correctly
                for p in tempParks {
                    print("Park: \(p)")
                }
                //assign to state variable
                _parks = State(initialValue: tempParks)
            } catch {
                print(error)
            }
        }
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
