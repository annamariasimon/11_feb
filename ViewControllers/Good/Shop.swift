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
    var coordinates: GeoPoint!

    var dictionary: [String: Any] {
        return ["name": name!,
                "category": category!,
                "city": city!,
                "title": title!,
                "postcode": postcode!,
                "address": address!]
    }
}
