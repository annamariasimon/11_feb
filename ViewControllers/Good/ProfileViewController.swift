import UIKit
import Firebase
import FirebaseStorage
import Kingfisher

class ProfileViewController: UIViewController {
    
    private var profile = [Profile]()
      private var userInfoDocumentRef: DocumentReference!
      
      private var receiptDet = [Details]()
      private var receiptDataCollectionRef: CollectionReference!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var lastVisitedShopLabel: UILabel!
    @IBOutlet weak var numberOfReceiptsLabel: UILabel!
    @IBOutlet weak var lastPriceLabel: UILabel!
    
    let db = Firestore.firestore()
     
     var image: UIImage? = nil
     
     let storage = Storage.storage()
     

     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         userInfoDocumentRef = Firestore.firestore().collection("users").document(Auth.auth().currentUser!.uid)
         
         receiptDataCollectionRef = Firestore.firestore().collection("users").document(Auth.auth().currentUser!.uid).collection("receipts")
         
    //     setupUI()
         
     }
     
     override func viewWillAppear(_ animated: Bool) {
         userInfoDocumentRef.getDocument { (document, error) in
             if error == nil {
                 if document != nil && document!.exists {
                     let documentData = document!.data()
                     let username = documentData?["firstname"] as? String ?? "Anonymus"
                     let avatarURL = documentData?["profileImageURL"] as? String ?? "https://firebasestorage.googleapis.com/v0/b/receipt-app-bba11.appspot.com/o/profile%2FeTyRjmHnHzLSPae6R2a1rmISLr62?alt=media&token=24e8ecf7-95b7-4064-be91-077f43305334"
                     
                     let userData = Profile(username: username, avatarURL: avatarURL)
                     
                     self.profile.append(userData)
                     
                     self.usernameLabel.text = username
                     
                     let url = URL(string: avatarURL)
                     self.profileImage.kf.setImage(with: url)
                 }
                 }
             }
         
         receiptDataCollectionRef.getDocuments { (snapshot, error) in
             if let err = error {
                 debugPrint("Error fetching docs: \(err)")
             } else {
                 guard let snap = snapshot else { return }
                 let number = snap.documents.count
                 
                 self.numberOfReceiptsLabel.text = "\(number)"       //number of receipts
                 
                 for document in snap.documents {
                     let data = document.data()
                     let companyName = data["companyName"] as? String ?? ""
                     let date = data["date"] as? Date ?? Date()
                     let itemPrice = data["itemPrice"] as? Double ?? 0.0
                     let paymentMethod = data["paymentMethod"] as? String ?? ""
                     
                     let recDet = Details(companyName: companyName, date: date, itemPrice: Double(itemPrice), paymentMethod: paymentMethod)
                     
                     self.receiptDet.append(recDet)
                 }
                 self.receiptDet.sort { $0.date > $1.date }
                 self.lastVisitedShopLabel.text = self.receiptDet[0].companyName     //last visited shop
                 
                 let priceText = "£\(self.receiptDet[0].itemPrice)"          // akkor mennyit koltott
                 self.lastPriceLabel.text = priceText
             }
         }
         
             } }
     
    
    func setupUI() {
//        setupAvatar()
    }
    
