//
//  ProfileViewController.swift
//  DarkPitchProject
//
//  Created by Sanaz Khosravi on 10/26/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit
import AlamofireImage
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        if user != nil{
            userNameLabel.text = user?.email
            print("************************" + (user?.email)!)
            profileImageView.af_setImage(withURL: (user?.photoURL)!)
        }
        
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
   
        
        
    

}
