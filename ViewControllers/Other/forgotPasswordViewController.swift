import UIKit

class forgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
               
               //Style the elements
            Utilities.styleTextField(emailTextField)
            Utilities.styleFilledButton(resetPasswordButton)
               
           }
    
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetPasswordDidTapped(_ sender: Any) {
     //   guard let email = emailTextField.text, email != "" else {
            
      //  }
    }
    
}
