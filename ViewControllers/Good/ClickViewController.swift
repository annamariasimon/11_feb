//MENU BUTTON MASHOVA
//MENU WORKING - sopy this into collectionv
//maybe old menu was better

import UIKit
import Firebase
import MapKit

class ClickViewController: UIViewController {
    
    let transition = SlideInTransition()
    
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var shopNameTV: UITextView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var postcodeLabel: UILabel!
    
    
    @IBAction func didTapMenu(_ sender: Any) {
       guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuViewController") as? MenuViewController
               else
              {  return }
               menuViewController.didTapMenuType = { menuType in
                   print(menuType)
               }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        
          if sender.selectedSegmentIndex == 0 {
                    mapView.mapType = .satellite
                } else {
                    mapView.mapType = .standard
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
                    
                self.shop = Shop()
               
                self.shop.city = document["city"] as? String
                self.shop.postcode = document["postcode"] as? String
                self.shop.name = document["name"] as? String
                self.shop.category = document["category"] as? String
                self.shop.title = document["title"] as? String
                self.shop.address = document["address"] as? String
                self.shop.postcode = document["postcode"] as? String
                self.shop.coordinates = document["coordinates"] as? GeoPoint
                    
                self.categoryLabel.text = self.shop.category
                self.cityLabel.text = self.shop.city
                self.postcodeLabel.text = self.shop.postcode
                    
                let asdaBournemouth = CLLocation(latitude: self.shop.coordinates.latitude, longitude: self.shop.coordinates.longitude)
                let regionRadius: CLLocationDistance = 300.0
                let region = MKCoordinateRegion(center: asdaBournemouth.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
                self.mapView.setRegion(region, animated: true)
                self.mapView.delegate = self
                    }
            }
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                loadShops()
                
                self.shopNameTV.text = item.companyName
            }
            
            override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                
            
               guard let item = item else {return}
                let newPrice = Double(round(100*item.itemPrice)/100)
                    textView.text = "Total paid: £\(newPrice)\n\nPayment method: \(item.paymentMethod!)\n\nTimestamp of payment:\n\n\(item.date!)\n\nFor a chance to win visit \(item.companyName!)'s website!"
            }
        }

        extension ClickViewController: MKMapViewDelegate{
            func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
                print("rendering...")
            }
        }
            
            extension ClickViewController: UIViewControllerTransitioningDelegate {
            func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
                transition.isPresenting = true
                return transition
            }
            func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
                transition.isPresenting = false
                return transition
            }
        }
