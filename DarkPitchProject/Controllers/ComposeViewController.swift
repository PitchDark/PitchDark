//
//  ComposeViewController.swift
//  DarkPitchProject
//
//  Created by Sanaz Khosravi on 10/26/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit
import MBProgressHUD

class ComposeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBAction func shareButtonAction(_ sender: Any) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        
    }
    
    
    @IBOutlet var imageFrame: UIImageView!
    
    
    
    @IBOutlet var captionText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageFrame.isUserInteractionEnabled = true
        
        
    }
    
    @IBAction func handlePan(recognizer:UITapGestureRecognizer) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        //   let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        imageFrame.image = editedImage
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}
