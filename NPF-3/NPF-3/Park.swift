
import Foundation
import CoreLocation
import MapKit


class Park: NSObject, Identifiable {
    var id = UUID()
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
    private var title : String = ""
    private var subtitle : String = ""
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    override var description: String{"ParkName: \(parkName), ParkLocation: \(parkLocation), DateFormed: \(dateFormed), Area: \(area), Link: \(link), Location: \(String(describing: location ?? nil)), ImageLink: \(imageLink), ParkDescription: \(parkDescription), Latitude: \(latitude), Longitude: \(longitude), imageSize: \(imageSize), imageType: \(imageType)" }
    
    
    init(coordinate: CLLocationCoordinate2D, imageSize: Double){
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
        self.imageSize = imageSize
        super.init()
        location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
    }
    
    func getParkName() -> String {
        parkName
    }
    func getLatitude() -> Double {
        latitude
    }
    func getLongitude() -> Double {
        longitude
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
