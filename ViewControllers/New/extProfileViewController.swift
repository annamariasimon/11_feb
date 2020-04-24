import UIKit

extension ProfileViewController {
    
    func setupAvatar() {
         profileImage.layer.cornerRadius = 5 //CHANGE
         profileImage.clipsToBounds = true
         profileImage.isUserInteractionEnabled = true
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
         profileImage.addGestureRecognizer(tapGesture)
     }
     
    @objc func presentPicker() {
         let picker = UIImagePickerController()
         picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
         self.present(picker, animated: true, completion: nil)
     }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profileImage.image = imageSelected
        }
        
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.image = imageOriginal
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}
