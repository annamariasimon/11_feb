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
              
              setUpElements()
              setupUI()
          }
          
          func setUpElements() {
              
              errorLabel.alpha = 0
          
              Utilities.styleTextField(firstNameTextField)
              Utilities.styleTextField(lastNameTextField)
              Utilities.styleTextField(emailTextField)
              Utilities.styleTextField(passwordTextField)
              Utilities.styleFilledButton(signUpButton)
          }
          
          func validateFields() -> String? {
       
              if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                  lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                  passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                  
                  return "Please fill in all fields."
                  
              }
              
              //check if the password is secure
    /*          let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
              
              if  Utilities.isPasswordValid(cleanedPassword) == false {
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
                  
                  showError(error!)
              }
              else {
                  
                  let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                  let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                  let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                  let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                  
                  Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
                      if error != nil {
                          
                          print(error.debugDescription)
                        
                          self.showError("Error creating user")
                          
                      }
                          
                      else {
                          
                        let db = Firestore.firestore()
                          
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
                                  
                                  storageProfileRef.downloadURL(completion: { (url, error) in
                                      if let metaImageURL = url?.absoluteString {
                                          print(metaImageURL)
                                          
                                          db.collection("users").document(result!.user.uid).setData(["firstname":firstName, "lastname":lastName, "profileImageURL":metaImageURL]) { (error) in
                                                                   
                                                                   if error != nil {
                                                                       print(error?.localizedDescription)
                                                                       self.showError("Error saving user data")
                                                                   }
                                                               }
                                                       
                                                        self.transitionToHome()
                                      }
                                  })
                                  })
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
