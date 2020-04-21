import UIKit
import Firebase

class Receipt {

    var timestamp: Timestamp!
    var date: Date! {
        return timestamp.dateValue()
    }
    var companyName: String!
    var itemPrice: Double!
    var paymentMethod: String?
    
    var shopId: String!
    var name: String!
    var category: String!
    var city: String!
    var title: String!
    var postcode: String!
    
  /*  struct coordinates {
        var longitude: CGFloat
        var latitude: CGFloat
    }
    */
    var coordinates: GeoPoint!
    
    var dictionary: [String: Any] {
        return ["companyName": companyName!,
                "date": Date()]
    }
    
}
