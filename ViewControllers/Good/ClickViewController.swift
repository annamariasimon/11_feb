import UIKit
import Firebase
import MapKit

class ClickViewController: UIViewController {
    
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
    
    var item: Receipt!
    var shop: Shop!

    func loadShops() {
        
        let shopRef = Firestore.firestore().collection("shops").document("\(item.shopId!)")
        
        shopRef.getDocument { (document, error) in
        
       
            guard let document = document, document.exists else {
                return
            }

           //   print(document.data())
            print("Hello")
            
        self.shop = Shop()
       
        self.shop.city = document["city"] as? String
        self.shop.postcode = document["postcode"] as? String
        self.shop.name = document["name"] as? String
        self.shop.title = document["title"] as? String
        self.shop.address = document["address"] as? String
        self.shop.postcode = document["postcode"] as? String
        self.shop.coordinates = document["coordinates"] as? GeoPoint
            
            self.shopInfoTV.text = self.shop.city
    
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
        
        self.shopNameTV.text = item.companyName //textView1 + image!
   //     self.shopInfoTV.text = shop.city
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    
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
