import UIKit
import FirebaseAuth
import Firebase
import FirebaseStorage

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var image: UIImage? = nil
    
     override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            
            setUpElements()
            setupUI()
        }
        
        func setUpElements() {
            
            errorLabel.alpha = 0
            
            //Style the elements
            
            Utilities.styleTextField(firstNameTextField)
            Utilities.styleTextField(lastNameTextField)
            Utilities.styleTextField(emailTextField)
            Utilities.styleTextField(passwordTextField)
            Utilities.styleFilledButton(signUpButton)
        }
    //check the fields & validate that the data is correct, if everything's correct, this method turns 0 otherwise error messgage
        
        func validateFields() -> String? {
            
            //check that all fields are filled in
            if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                
                return "Please fill in all fields."
                
            }
            
      /*      //check if the password is secure
            let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if  Utilities.isPasswordValid(cleanedPassword) == false {
                //password isn't secure enough
                
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
                
            }
            */
         /*
             //SAME BUT FOR EMAIL - create a regular expression for it first
            
          let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                      
                      if  Utilities.isEmailValid(cleanedPassword) == false {
                          //password isn't secure enough
                          
                      return "Please make sure your password is at least 8 characters, contains a special character and a number."
                          
                      } */
            
            return nil
        }
        
      
    @IBAction func signUpTapped(_ sender: Any) {
        
        guard let imageSelected = self.image else {
            print("Avatar is nil")
            return
        }
        
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
            return
        }
            
            //validate the fields
            let error = validateFields()
            
            if error != nil {
                //There's something wrong in the fields, show error message
                showError(error!)
            }
            else {
                
                //create cleaned versions of the data
                let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                //create the user
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
                    //check for errors
                    if error != nil {
                        
                        print(error.debugDescription)
                        
                        //There was an error creating the user
                        self.showError("Error creating user")
                        
                    }
                        
                    else {
                        
                        //user was created successfully, now store the first and last name
                      let db = Firestore.firestore()
                        
                  //      db.collection("users").document(result!.user.uid).setData(["firstname":firstName, "lastname":lastName, "uid": result!.user.uid]) { (error) in
                        let storageRef = Storage.storage().reference(forURL: "gs://receipt-app-bba11.appspot.com")
                        let storageProfileRef = storageRef.child("profile").child(result!.user.uid)
                        
                        let metadata = StorageMetadata()
                        metadata.contentType = "image/jpg"
                        storageProfileRef.putData(imageData, metadata: metadata, completion:
                            { (StorageMetaData, error) in
                                if error != nil {
                                    print(error?.localizedDescription)
                                    return
                                }
                                
                                })
                        
                        
                        db.collection("users").document(result!.user.uid).setData(["firstname":firstName, "lastname":lastName]) { (error) in
                            
                            if error != nil {
                                print(error?.localizedDescription)
                                self.showError("Error saving user data")
                            }
                        }
                        
                           //transition to the home screen
                 self.transitionToHome()
                        
                    }
                }
                
            }
            
         
        }
        
        func showError(_ message:String){
            errorLabel.text = message
            errorLabel.alpha = 1
            
        }
        
       func transitionToHome(){
            
           let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController)
            present(homeViewController!, animated: true, completion: nil)
            
        }
    
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
     func setupUI() {
           setupAvatar()
       }
    
    }
