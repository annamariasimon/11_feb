import UIKit
import FirebaseAuth
import Firebase

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    let db = Firestore.firestore()
    
    var image: UIImage? = nil
    
    func getUserInfo() {
        let userInfo = db.collection("users").document(Auth.auth().currentUser!.uid)
        userInfo.getDocument { (document, error) in
            if error == nil {
                if document != nil && document!.exists {
                    let documentData = document!.data()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupUI()
        
        
    }
    
    func setupUI() {
//        setupAvatar()
    }
    
}
