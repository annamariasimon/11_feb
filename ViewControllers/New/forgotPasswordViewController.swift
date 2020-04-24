//
//  forgotPasswordViewController.swift
//  11_feb
//
//  Created by Annamaria Simon on 24/04/2020.
//  Copyright © 2020 Annamaria Simon. All rights reserved.
//

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
    

}
