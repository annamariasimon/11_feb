import UIKit
import Firebase

class Receipt {
  /*  var title: String
    var description: String */
    var timestamp: Timestamp!
    
    var date: Date! {
        return timestamp.dateValue()
    }
    
    var companyName: String!
  //  var companyInfo: String!
//    var itemSold: String!
    var itemPrice: Double!
//    var currency: String!
   // var total: Double!
//    var VAT: Double!
   var paymentMethod: String?
    
    var shopID: Int!
    var name: String!
    var category: String!
    var city: String!
    var title: String!
    var postcode: String!
    
    struct coordinates {
        var longitude: CGFloat
        var latitude: CGFloat
    }
    
//    var authorisationNo: Int!
  //  var telephone: Int!
    
    var dictionary: [String: Any] {
        return ["companyName": companyName!,
                "date": Date(),
               // "companyInfo": companyInfo!
                
            /*, companyInfo*/]
    }
    
}
