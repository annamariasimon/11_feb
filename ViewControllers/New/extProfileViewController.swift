//
//  extProfileViewController.swift
//  11_feb
//
//  Created by Annamaria Simon on 24/04/2020.
//  Copyright © 2020 Annamaria Simon. All rights reserved.
//

import UIKit

extension ProfileViewController {
    
    func setupAvatar() {
         profileImage.layer.cornerRadius = 10
         profileImage.clipsToBounds = true
         profileImage.isUserInteractionEnabled = true
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
         profileImage.addGestureRecognizer(tapGesture)
     }
     
    @objc func presentPicker() {
         let picker = UIImagePickerController()
         picker.sourceType = .photoLibrary
         self.present(picker, animated: true, completion: nil)
     }
    
}
