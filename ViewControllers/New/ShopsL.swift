import MapKit
import Contacts
import Foundation

class ShopsL: NSObject, MKAnnotation {
    
  let coordinate: CLLocationCoordinate2D
  let title: String?
  let category: String?
  let address: String?
//  let coordinates: CLLocationCoordinate2D
  
  init(
    title: String,
    category: String,
    address: String,
    coordinate: CLLocationCoordinate2D){
    
    self.title = title
    self.category = category
    self.address = address
    self.coordinate = coordinate
    
    super.init()
  }
    
    //JSON INFO
 
    /*
    init?(feature: ShopsData) {
    // 1
    guard
      let point = feature.coordinates.first as? MKPointAnnotation,
      // 2
      let propertiesData = feature.properties,
      let json = try? JSONSerialization.jsonObject(with: propertiesData),
      let properties = json as? [String: Any]
      else {
        return nil
    }
        */
  
  var subtitle: String? {
    return category
  }
    //TO OPEN UP MAPS:
    
    var mapItem: MKMapItem? {
      guard let location = address else {
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
