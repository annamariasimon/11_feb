import UIKit
import Firebase

class Shop {

    var shopId: String!
    var name: String!
    var category: String!
    var city: String!
    var title: String!
    var postcode: String!
    var address: String!
    var coordinates: GeoPoint! //store it like this in firebase
    
    var dictionary: [String: Any] {
        return ["name": name!]
    }
    
}
