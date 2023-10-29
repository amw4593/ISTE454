//
//  Landmark.swift
//  FavoritePlaces
//

import Foundation
import CoreLocation

class Landmark: NSObject {
    var name  = ""
    var state = ""
    var location : CLLocation?
    
    var coordinate: CLLocationCoordinate2D {
        get {
            return location!.coordinate
        }
    }
    override var description : String {
        return "{\n\t Landmark Name: \(name)\n\t State: \(state)\n\t location: \(String(describing: location))\n}"
    }
    
    
    var title : String? {
        get {
            return name
        }
    }
    
   var subtitle : String? {
        get {
            return state
        }
    }


    init(name: String, state: String, location: CLLocation) {
        self.name = name
        self.state = state
        self.location = location
    }
    
}
