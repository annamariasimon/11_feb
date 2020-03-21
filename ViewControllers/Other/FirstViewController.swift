//
//  FirstViewController.swift
//  11_feb
//
//  Created by Annamaria Simon on 01/03/2020.
//  Copyright © 2020 Annamaria Simon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements() {
    
    Utilities.styleFilledButton(signUpButton)
    Utilities.styleHollowButton(loginButton)
    
    

}
}
