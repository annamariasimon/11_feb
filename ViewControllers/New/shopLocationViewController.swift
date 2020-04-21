import UIKit
import MapKit

class shopLocationViewController: UIViewController {
    
    private var datas: [ShopsL] = []

    @IBOutlet weak var mapView: MKMapView!
    
 /*   var coordinate2D = CLLocationCoordinate2DMake(50.725830, -1.865020)
    
   
    func updateMapRegion(rangeSpan: CLLocationDistance){
        let region = MKCoordinateRegion(center: coordinate2D, latitudinalMeters: rangeSpan, longitudinalMeters: rangeSpan)
        mapView.region = region
    } */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 50.720191, longitude: -1.879161) //Bmouth Town Center will be the centre
     //   updateMapRegion(rangeSpan: 800)
        mapView.centerToLocation(initialLocation)
        
        
        let asdaLoc = CLLocation(latitude: 50.726586, longitude: -1.865241)
        let region = MKCoordinateRegion(
          center: asdaLoc.coordinate,
          latitudinalMeters: 50000,
          longitudinalMeters: 60000)
        mapView.setCameraBoundary(
          MKMapView.CameraBoundary(coordinateRegion: region),
          animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        mapView.delegate = self
        
     /*   mapView.register(shopView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        loadInitialData()
        mapView.addAnnotation(datas) */
        
        let asDa = ShopsL(
          title: "Asda Bournemouth",
          category: "Supermarket",
          address: "Bournemouth",
          coordinate: CLLocationCoordinate2D(latitude: 50.726586, longitude: -1.865241))
        mapView.addAnnotation(asDa)
    }

}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
    //OPEN UP MAPS START:
    func mapView(
      _ mapView: MKMapView,
      annotationView view: MKAnnotationView,
      calloutAccessoryControlTapped control: UIControl
    ) {
      guard let asDa = view.annotation as? ShopsL else {
        return
      }

      let launchOptions = [
        MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
      ]
      asDa.mapItem?.openInMaps(launchOptions: launchOptions)
    }
    //OPEN UP MAPS END
}

extension shopLocationViewController: MKMapViewDelegate {
  // 1
  func mapView(
    _ mapView: MKMapView,
    viewFor annotation: MKAnnotation
  ) -> MKAnnotationView? {
    // 2
    guard let annotation = annotation as? ShopsL else {
      return nil
    }
    // 3
    let identifier = "asDa"
    var view: MKMarkerAnnotationView
    // 4
    if let dequeuedView = mapView.dequeueReusableAnnotationView(
      withIdentifier: identifier) as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
    } else {
      // 5
      view = MKMarkerAnnotationView(
        annotation: annotation,
        reuseIdentifier: identifier)
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    return view
  }
}
