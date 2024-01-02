

import Foundation
import CoreLocation

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
    
    var coordinate: CLLocationCoordinate2D {
        get {
            return location?.coordinate ?? CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
    
    var title : String? {
         parkName
    }
    
    var subtitle : String? {
         parkLocation
    }
    
    override var description: String{"ParkName: \(parkName), ParkLocation: \(parkLocation), DateFormed: \(dateFormed), Area: \(area), Link: \(link), Location: \(String(describing: location ?? nil)), ImageLink: \(imageLink), ParkDescription: \(parkDescription), Latitude: \(latitude), Longitude: \(longitude), imageSize: \(imageSize), imageType: \(imageType)" }
    
    
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, imageSize: Double){
        self.parkName = title
        self.parkLocation = subtitle
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
        self.imageSize = imageSize
        super.init()
        location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
    }
}
extension Park{
    static func all() -> [Park] {

        if let path = Bundle.main.path(forResource: "data", ofType: "plist") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let tempDict = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String:Any]

                print(tempDict)

                let tempArray = tempDict["parks"]! as! Array<[String:Any]>

                var tempParks: [Park] = []

                for dict in tempArray {

                    print(dict)
                    let title = dict["title"] as? String ?? ""
                    let subtitle = dict["subtitle"] as? String ?? ""
                    let latitude = dict["latitude"] as? Double ?? 0.0
                    let longitude = dict["longitude"] as? Double ?? 0.0
                    let imageSize = dict["imageSize"] as? Double ?? 0.0

                    let location = CLLocation(latitude: latitude, longitude: longitude)
                    let pk = Park(title: title, subtitle: subtitle, coordinate: location.coordinate, imageSize: imageSize)

                    tempParks.append(pk)

                }

                print("There are \(tempParks.count) parks")
                print(tempParks)

                return tempParks.sorted(by: {$0.parkName < $1.parkName})

            } catch {
                print(error)
            }
        }
        return[]
    }
}
