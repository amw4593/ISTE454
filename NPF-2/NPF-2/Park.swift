//
//  Park.swift
//  NPF-2
//
//  Created by gccisadmin on 10/12/23.
//

import Foundation
import CoreLocation


class Park: CustomStringConvertible {
    private var parkName : String = ""
    private var parkLocation : String = ""
    private var dateFormed : String = ""
    private var area : String = ""
    var link : String = ""
    private var location : CLLocation?
    private var imageLink : String = ""
    private var parkDescription : String = ""
    private var latitude : Double
    private var longitude : Double
    private var imageSize : Double
    private var imageType : String = ""
    
    
    var description: String{"ParkName: \(parkName), ParkLocation: \(parkLocation), DateFormed: \(dateFormed), Area: \(area), Link: \(link), Location: \(String(describing: location ?? nil)), ImageLink: \(imageLink), ParkDescription: \(parkDescription), Latitude: \(latitude), Longitude: \(longitude), imageSize: \(imageSize), imageType: \(imageType)" }
    
    
    init(parkName: String, parkLocation: String, dateFormed: String, area: String, link: String, location: CLLocation?, imageLink: String, parkDescription: String, latitude: Double, longitude: Double, imageSize: Double, imageType: String){
        
        self.parkName = parkName
        self.parkLocation = parkLocation
        self.link = link
        self.area = area
        self.dateFormed = dateFormed
        self.imageLink = imageLink
        self.parkDescription = parkDescription
        self.location = location
        self.latitude = latitude
        self.longitude = longitude
        self.imageSize = imageSize
        self.imageType = imageType
        
    }
    
    convenience init () {
        self.init(parkName: "Unknown", parkLocation: "Unknown",
                  dateFormed: "Unknown", area: "Unknown", link:"Unknown", location: nil,
                  imageLink: "Unknown", parkDescription: "Unknown", latitude: 0.0, longitude: 0.0, imageSize: 0.0, imageType: "Unknown")
    }
    
    func getParkName() -> String {
        parkName
    }
    func set(parkName: String) {
        let nameTrim = parkName.trimmingCharacters(in: .whitespaces)
        if nameTrim.count <= 3 && nameTrim.count <= 75 {
            self.parkName = nameTrim
            print("Hey")
        }else{
            print("Bad value of \(parkName) in set(ParkName): Setting to TBD")
            self.parkName = "TBD"
        }
    }
    func set(parkLocation: String){
        let locationTrim = parkLocation.trimmingCharacters(in: .whitespaces)
        if locationTrim.count <= 3 && locationTrim.count <= 75 {
            self.parkLocation = locationTrim
        }else{
            print("Bad value of \(parkLocation) in set(ParkLocation): Setting to TBD")
            self.parkLocation = "TBD"
        }
    }
}
