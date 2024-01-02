
import Foundation
import Combine
import SwiftUI

@Observable
class DataViewModel {
    
    //output
    var data: [ParkStruct] = []
    var errorMessage = ""
    var error = false
    var isDone = true
    
    private var task: AnyCancellable? = nil
    
    func fetch(urlString: String){
        
        guard let url = URL(string: urlString) else {
            error = true
            isDone = true
            errorMessage = "Problem with URL String"
            return
        }
        
        task = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse
                else {
                    self.error = true
                    self.errorMessage = "Bad Response"
                    throw URLError(.badServerResponse)
                }
                //check status code
                guard httpResponse.statusCode == 200 else {
//                    return "Bad Status Code: \(httpResponse.statusCode)"
                    return [ParkStruct]()
                }
                print(httpResponse)
                
                let decoder = JSONDecoder()
                let parkList = try! decoder.decode(ParksStruct.self, from: data)
                return parkList.parks
                
//                let encoder = JSONEncoder()
//                let parkData = try! encoder.encode(parkList.self)
//                let parkStr = String.init(data: parkData, encoding: .utf8)
//                return parkStr ?? ""
//                return String(data: data, encoding: String.Encoding(rawValue: String.Encoding.ascii.rawValue)) ?? ""
            }
            .receive(on: RunLoop.main)
            .catch({ Error -> Just<[ParkStruct]> in
                print(Error)
                self.error = true
                self.errorMessage = "Bad Response"
                return Just<[ParkStruct]>([ParkStruct]())
                
            })
            .eraseToAnyPublisher()
            .sink(receiveValue: {results in
                self.isDone = true
                self.data = results
            })
    }//fetch
    
}//class
