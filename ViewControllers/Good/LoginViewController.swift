import UIKit
import FirebaseAuth

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
            
            //Hide the error label
            errorLabel.alpha = 0
            
            //Style the elements
            Utilities.styleTextField(emailTextField)
            Utilities.styleTextField(passwordTextField)
            Utilities.styleFilledButton(loginButton)
            
        }
 /*   func validateFields() -> String? {
               
               //check that all fields are filled in
               if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                   passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                   
                   return "Please fill in all fields."
                   
        } } */

        //create function from login button - KYLE

    
    @IBAction func loginTapped(_ sender: Any) {
    
            
      /*  //validate the fields
                  let error = validateFields()
                  
                  if error != nil {
                      //There's something wrong in the fields, show error message
                      showError(error!)
                  } */
        
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            Auth.auth().signIn(withEmail: email, password: password){
             (result, error) in
                if error != nil{
                           //Couldn't sign in
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
