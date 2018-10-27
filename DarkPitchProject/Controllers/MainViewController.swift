//
//  MainViewController.swift
//  DarkPitchProject
//
//  Created by Sanaz Khosravi on 10/26/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let refreshControl = UIRefreshControl()
    let HeaderViewIdentifier = "TableViewHeaderView"
    
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        myTableView.insertSubview(refreshControl, at: 0)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 450
        myTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HeaderViewIdentifier)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderViewIdentifier) as! UITableViewHeaderFooterView
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    @IBAction func logOutActionButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            print("signed out")
            if let storyboard = self.storyboard {
                let vc = storyboard.instantiateViewController(withIdentifier: "launchScreen")
                self.present(vc, animated: false, completion: nil)
            }
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            alertTheUser(title: "Sign Out Error", message: signOutError.localizedDescription)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
       
        
    }
    
    private func alertTheUser(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction (title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? PostCell {
            let detailView = segue.destination as! DetailViewController
            
        }
    }
}
