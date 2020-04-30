import Foundation
import UIKit

class Details {
    var companyName: String
    var date: Date
    var itemPrice: Double
    var paymentMethod: String
    
    init(companyName: String, date: Date, itemPrice: Double, paymentMethod: String) {
        self.companyName = companyName
        self.date = date
        self.itemPrice = itemPrice
        self.paymentMethod = paymentMethod
    }
}
