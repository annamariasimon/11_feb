import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
   override func viewDidLoad() {
              super.viewDidLoad()
              
              setUpElements()
          }
          
          func setUpElements(){
              
              errorLabel.alpha = 0
              
              Utilities.styleTextField(emailTextField)
              Utilities.styleTextField(passwordTextField)
              Utilities.styleFilledButton(loginButton)
              
          }
      func validateFields() -> String? {
                 
                 if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                     passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                     
                     return "Please fill in all fields."
          }
          return nil
      }

    @IBAction func loginTapped(_ sender: Any) {
    
            
         let error = validateFields()
                        
                        if error != nil {
                           
                      showError(error!)
                        } else {
              
                  let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                  let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                  
                  
                  Auth.auth().signIn(withEmail: email, password: password){
                   (result, error) in
                      if error != nil{
                                 
                                 self.errorLabel.text = error!.localizedDescription
                                 self.errorLabel.alpha = 1
                  }
                 
                  else{
                          
                         let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? UINavigationController
                                       
                          self.view.window?.rootViewController = homeViewController
                          self.view.window?.makeKeyAndVisible()
                      }
              }
              }
              
              }
    
    @IBAction func dismissAction(_ sender: Any) {
    navigationController?.popViewController(animated: true)
    }
            
            func showError(_ message:String){
                       errorLabel.text = message
                       errorLabel.alpha = 1
                   }
            }
