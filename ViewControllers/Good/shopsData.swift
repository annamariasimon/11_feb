import Foundation

struct shopsData: Codable {
    var name: String 
          var category: String
          var address: String
          var city: String
          var id: Int
          var postcode: String
          fileprivate var imageName: String
          fileprivate var coordinates: Coordinates
          
}
      
struct Coordinates: Hashable, Codable {
          var latitude: Double
          var longitude: Double
}
