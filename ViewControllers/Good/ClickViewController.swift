import UIKit
import Firebase
import MapKit


class ClickViewController: UIViewController {
    
 //    let datam = DataLoader().ShopsData
    
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var shopNameTV: UITextView!
    @IBOutlet weak var shopInfoTV: UITextView!
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        } else {
            mapView.mapType = .satellite
        }
    }
    
 /*   struct shopDataset: Codable {
        
        var name:String = ""
        var category:String = ""
        var address:String = ""
        var city:String = ""
        var id:Int = 0
        var postcode:String = ""
        fileprivate var imageName:String = ""
        fileprivate var coordinates:Coordinates
        
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    */
    var item: Receipt!
    var shop: Shop!
    
  //  let data: shopData
 //   let json = try? JSONSerialization.jsonObject(with: data, options: [])
   
    
    func loadShops() {
        let shopRef = Firestore.firestore().collection("shops").document("\(item.shopId!)")
        
       shopRef.getDocument { (document, error) in
            
            guard let document = document else{
                return
            }
        
        self.shop = Shop()
               // r.telephone = document["telephone"] as? Int
        self.shop.city = document["city"] as? String
        self.shop.postcode = document["postcode"] as? String
        self.shop.name = document["name"] as? String
        self.shop.title = document["title"] as? String
        self.shop.address = document["address"] as? String
        self.shop.postcode = document["postcode"] as? String
        self.shop.coordinates = document["coordinates"] as? GeoPoint
        
            }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadShops()
        
        let asdaBournemouth = CLLocation(latitude: 50.725830, longitude: -1.865020)
        let regionRadius: CLLocationDistance = 300.0
        let region = MKCoordinateRegion(center: asdaBournemouth.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        shopNameTV.text = item.companyName //textView1 + image!
        shopInfoTV.text = shop.city
    
       guard let item = item else {return}
            textView.text = "\(item.date!)\n\nPrice: £\( item.itemPrice!)\n\n\(item.paymentMethod)"
                
            //should only appear if it's not nil
    
        
    }

    func save() {
        // send this to firebase
        // ref users/uid/receipts
     //   ref.setData(item?.dictionary)
       
    }
    
}

extension ClickViewController: MKMapViewDelegate{
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("rendering...")
    }
}
