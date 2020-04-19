import MapKit
import Contacts

class ShopsL: NSObject, MKAnnotation {
    
let coordinate: CLLocationCoordinate2D
  let title: String?
  let category: String?
  let address: String
//  let coordinates: CLLocationCoordinate2D
  
  init(title: String, category: String, address: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.category = category
    self.address = address
    self.coordinate = coordinate
    
    super.init()
  }
  
  var subtitle: String? {
    return category
  }
    //TO OPEN UP MAPS:
    
    var mapItem: MKMapItem? {
      guard let location = category else {
        return nil
      }

      let addressDict = [CNPostalAddressStreetKey: location]
      let placemark = MKPlacemark(
        coordinate: coordinate,
        addressDictionary: addressDict)
      let mapItem = MKMapItem(placemark: placemark)
      mapItem.name = title
      return mapItem
    }
}
