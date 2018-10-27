//
//  ViewController.swift
//  DarkPitchProject
//
//  Created by Sanaz Khosravi on 10/26/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FacebookLogin
import FBSDKLoginKit

class LoginViewController : UIViewController, GIDSignInUIDelegate {

    
    @IBAction func signInWithGmail(_ sender: Any) {
        
        GIDSignIn.sharedInstance().signIn()
        
        
    }
    
    
   
    @IBOutlet var gmailButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

