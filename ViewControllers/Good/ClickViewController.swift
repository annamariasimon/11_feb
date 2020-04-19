import UIKit
import Firebase
import MapKit


class ClickViewController: UIViewController {
    
     let datam = DataLoader().ShopsData
    
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
    
  //  let data: shopData
 //   let json = try? JSONSerialization.jsonObject(with: data, options: [])
   

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let asdaBournemouth = CLLocation(latitude: 50.725830, longitude: -1.865020)
        let regionRadius: CLLocationDistance = 300.0
        let region = MKCoordinateRegion(center: asdaBournemouth.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        shopNameTV.text = datam[0].name //textView1 + image!
        shopInfoTV.text = datam[0].city
    
       guard let i = item else {return}
            textView.text = "\(i.date!)\n\nPrice: £\( i.itemPrice!)\n\n\(i.paymentMethod)"
                
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
