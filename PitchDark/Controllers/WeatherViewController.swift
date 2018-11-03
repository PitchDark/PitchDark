//
//  WeatherViewController.swift
//  Instagram
//
//  Created by Sanaz Khosravi on 11/2/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    
    @IBOutlet var humidityLabel: UILabel!
    
    @IBOutlet var mainforecast: UILabel!
    
    @IBOutlet var iconImageView: UIImageView!
    
    @IBOutlet var windspeed: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var desc: UILabel!
    
    var long : Double = 0.0
    var lat : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    


}
