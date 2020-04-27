//AUTOMATE MAPS? - comments under addAnnotations

import UIKit
import MapKit

class map2ViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    private var currentCoordinate: CLLocationCoordinate2D?
    
/*    private var destinations:[MKPointAnnotation] = []
    private var currentRoute: MKRoute? */

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        configuraLocationDervices()
        // Do any additional setup after loading the view.
    }
    
    private func configuraLocationDervices() {
        locationManager.delegate = self
        
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization() //this should be request.whenInUseAuthorisation
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
           beginLocationUpdates(locationManager: locationManager)
        }
    }
    
    private func beginLocationUpdates(locationManager: CLLocationManager) {
        mapView.showsUserLocation = true
                   locationManager.desiredAccuracy = kCLLocationAccuracyBest
                   locationManager.startUpdatingLocation()
    }
    
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(zoomRegion, animated: true)
    }

    private func addAnnotations() {
        
        //could be like: add newAnnotation: if there is a new shopId, let newAnnotation
        
        let asdaLondonAnnotation = MKPointAnnotation()
        asdaLondonAnnotation.title = "Asda"     //shop.newshopid.title
        asdaLondonAnnotation.subtitle = "London, NW9 0AS"
        asdaLondonAnnotation.coordinate = CLLocationCoordinate2D(latitude: 51.59465, longitude: -0.261743) //THESE COORDINATES SHOULD COME FROM THE SHOP INFO LIKE shop.asdashopId.coordinates.latitude and longtitudeű
        
        let primarkLondonAnnotation = MKPointAnnotation()
        primarkLondonAnnotation.title = "Primark"
        primarkLondonAnnotation.subtitle = "London, W1D 1AU"
        primarkLondonAnnotation.coordinate = CLLocationCoordinate2D(latitude: 51.516576, longitude: -0.131099)
        
        let asdaBournemouthAnnotation = MKPointAnnotation()
        asdaBournemouthAnnotation.title = "Asda"
        asdaBournemouthAnnotation.subtitle = "Bournemouth, BH8 8DL"
        asdaBournemouthAnnotation.coordinate = CLLocationCoordinate2D(latitude: 50.72583, longitude: -1.86502)
        
        let tescoMetroBmouthAnnotation = MKPointAnnotation()
        tescoMetroBmouthAnnotation.title = "Tesco"
        tescoMetroBmouthAnnotation.subtitle = "Bournemouth, BH2 6DT"
        tescoMetroBmouthAnnotation.coordinate = CLLocationCoordinate2D(latitude: 50.72131, longitude: -1.88082)
        
        let wilkoBmouthAnnotation = MKPointAnnotation()
        wilkoBmouthAnnotation.title = "Wilko"
        wilkoBmouthAnnotation.subtitle = "Bournemouth, BH1 1EN"
        wilkoBmouthAnnotation.coordinate = CLLocationCoordinate2D(latitude: 50.721802, longitude: -1.875809)
        
        let bootsSouthamptonAnnotation = MKPointAnnotation()
        bootsSouthamptonAnnotation.title = "Boots"
        bootsSouthamptonAnnotation.subtitle = "Southampton, SO14 7DX"
        bootsSouthamptonAnnotation.coordinate = CLLocationCoordinate2D(latitude: 50.903525, longitude: -1.404396)
        
        let pretLondonAnnotation = MKPointAnnotation()
        pretLondonAnnotation.title = "Pret A Manger"
        pretLondonAnnotation.subtitle = "London, SW1E 5NA"
        pretLondonAnnotation.coordinate = CLLocationCoordinate2D(latitude: 51.496396, longitude: -0.142225)
        
        let mcDonaldsBigBen = MKPointAnnotation()
        mcDonaldsBigBen.title = "McDonald's"
        mcDonaldsBigBen.subtitle = "London, SE1 7PB"
        mcDonaldsBigBen.coordinate = CLLocationCoordinate2D(latitude: 51.501414, longitude: -0.119631)
        
  /*      destinations.append(asdaLondonAnnotation)
        destinations.append(primarkLondonAnnotation)
        destinations.append(asdaBournemouthAnnotation)
        destinations.append(tescoMetroBmouthAnnotation)
        destinations.append(wilkoBmouthAnnotation)
        destinations.append(bootsSouthamptonAnnotation)
        destinations.append(pretLondonAnnotation)
        destinations.append(mcDonaldsBigBen) */
        
        mapView.addAnnotation(asdaLondonAnnotation)
        mapView.addAnnotation(primarkLondonAnnotation)
        mapView.addAnnotation(asdaBournemouthAnnotation)
        mapView.addAnnotation(tescoMetroBmouthAnnotation)
        mapView.addAnnotation(wilkoBmouthAnnotation)
        mapView.addAnnotation(bootsSouthamptonAnnotation)
        mapView.addAnnotation(pretLondonAnnotation)
        mapView.addAnnotation(mcDonaldsBigBen)
        
    }
    
  /*  private func constructRoute(userLocation: CLLocationCoordinate2D) {
        let directionsRequest = MKDirections.Request()
        directionsRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation))
        directionsRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinations[0].coordinate))
        directionsRequest.requestsAlternateRoutes = true
        directionsRequest.transportType = .walking
        
        let directions = MKDirections(request: directionsRequest)
        
        directions.calculate { [weak self] (directionsResponse, error) in
            guard let strongSelf = self else { return }
            
            if let error = error {
                print(error.localizedDescription)
            } else if let response = directionsResponse, response.routes.count > 0 {
                strongSelf.currentRoute = response.routes[0]
                
                strongSelf.mapView.addOverlay(response.routes[0].polyline)
                strongSelf.mapView.setVisibleMapRect(response.routes[0].polyline.boundingMapRect, animated: true)
            }
        }
    }
    */
}

extension map2ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else { return }
        
        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
            addAnnotations()
     //       constructRoute(userLocation: latestLocation.coordinate)
        }
        currentCoordinate = latestLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: manager)
        }
    }
}

extension map2ViewController: MKMapViewDelegate {
    /*
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let currentRoute = currentRoute else {
             return MKOverlayRenderer()
        }
        
        let polyLineRenderer = MKPolylineRenderer(polyline: currentRoute.polyline)
        polyLineRenderer.strokeColor = UIColor.black
        polyLineRenderer.lineWidth = 4
        
        return polyLineRenderer
        
    }
    */
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        }
        
        if let title = annotation.title, title == "Asda" {
            annotationView?.image = UIImage(named: "asdaLog1")
        } else if let title = annotation.title, title == "Primark" {
            annotationView?.image = UIImage(named: "primarkPici")
        } else if let title = annotation.title, title == "Tesco" {
            annotationView?.image = UIImage(named: "tescoLog")
        } else if let title = annotation.title, title == "Wilko" {
            annotationView?.image = UIImage(named: "wilkoLogo")
        } else if let title = annotation.title, title == "Boots" {
            annotationView?.image = UIImage(named: "bootsLogo")
        } else if let title = annotation.title, title == "Pret A Manger" {
            annotationView?.image = UIImage(named: "pretLogo")
        } else if let title = annotation.title, title == "McDonald's" {
            annotationView?.image = UIImage(named: "mekiLog1")
        }
        else if annotation === mapView.userLocation {
            annotationView?.image = UIImage(named: "meloc")     //or profile picture
        }
        
        annotationView?.canShowCallout = true
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("annotation was selected: \(String(describing: view.annotation?.title))")
    }
}
