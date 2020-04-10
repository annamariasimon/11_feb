import UIKit
import Firebase
import MapKit

class ClickViewController: UIViewController {

    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        } else {
            mapView.mapType = .satellite
        }
    }
    
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
        guard let i = item else {return}
            textView.text = "\(i.date!)\n\n\(i.companyName!)\n\nPrice: £\( i.itemPrice!)\n\n\(i.paymentMethod)"
                
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
