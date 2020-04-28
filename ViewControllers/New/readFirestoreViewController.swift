import UIKit
import Firebase

class readFirestoreViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
     var item: Receipt!
     var shop: Shop!
    var items: [Shop] = []
    
    func loadShops() {
        let db = Firestore.firestore()
            
     
        let shopRef = db.collection("shops").document("0cInZlOAQ8Sxw5g4LDOo")
          
          shopRef.getDocument { (document, error) in
              if error == nil {
                  if document != nil && document!.exists {
                      let documentData = document?.data()
                      
                      self.shop = Shop()
                      
                      self.shop.city = document?["city"] as? String
                      
                      self.label.text = self.shop.city
                      
                  }
              }
          }
         
         /*
            db.collection("shops").getDocuments { (snapshot, error) in
                if error == nil && snapshot != nil {
                    for document in snapshot!.documents {
                        let documentData = document.data()
                        let s = self.shop
                        
                        s?.name = document["name"] as? String
                        s?.category = document["category"] as? String
                        s?.address = document["address"] as? String
                        s?.city = document["city"] as? String
                        s?.postcode = document["postcode"] as? String
                        
                        self.items.append(s!)
                        
                    }
                }
            }
            
             */
            
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
loadShops()
}
    
}
