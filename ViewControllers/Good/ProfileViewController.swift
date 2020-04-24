import UIKit
import FirebaseAuth
import Firebase

class ProfileViewController: UIViewController {
    
 var item: Receipt!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        guard let item = item else {return}
        usernameLabel.text = "hello"
        
    
    }
    
    
}
