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
    
    var description: String{"ParkName: \(parkName), ParkLocation: \(parkLocation), DateFormed: \(dateFormed), Area: \(area), Link: \(link), Location: \(location ?? nil), ImageLink: \(imageLink), ParkDescription: \(parkDescription)" }
    
    
    init(parkName: String, parkLocation: String, dateFormed: String, area: String, link: String, location: CLLocation?, imageLink: String, parkDescription: String){
        
        self.parkName = parkName
        self.parkLocation = parkLocation
        self.link = link
        self.area = area
        self.dateFormed = dateFormed
        self.imageLink = imageLink
        self.parkDescription = parkDescription
        self.location = location
        
    }
    
    convenience init () {
        self.init(parkName: "Unknown", parkLocation: "Unknown",
                  dateFormed: "Unknown", area: "Unknown", link:"Unknown", location: nil,
                  imageLink: "Unknown", parkDescription: "Unknown")
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
    let p1 : Park = Park()
    print("\(p1)")
    
    let p2 : Park = Park(parkName: "Acadia National Park", parkLocation: "Maine", dateFormed: "1919-02-26", area: "47,389.67 acres (191.8 squarekm)", link: "TBD", location: nil,
                         imageLink: "TBD", parkDescription: "TBD")
    
    print("\(p2)")
    p2.link = "http://en.wikipedia.org/wiki/Acadia_National_Park"
    print("\(p2)")
    
    let p3 = Park(parkName: "ab", parkLocation: "na", dateFormed: "1919-02-26", area: "47,389.67 acres(191.8 square km)", link: "TBD", location: nil, imageLink: "TBD", parkDescription: "TBD")
    print("\(p3)")
