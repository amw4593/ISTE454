
import Foundation

struct ParkStruct: Codable, Identifiable {
    var id = UUID()
    var parkName: String
    var state: String
    var dateFormed: String
    var descrip: String
    
    enum CodingKeys: String, CodingKey {
        case parkName
        case dateFormed
        case state = "parkLocation"
        case descrip = "description"
    }
    
}

struct ParksStruct: Codable {
    
    
    var parks: [ParkStruct]
    
    
}
