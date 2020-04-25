import UIKit
import FirebaseAuth
import Firebase

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupUI()
        
    }
    
    func setupUI() {
//        setupAvatar()
    }
    
}
