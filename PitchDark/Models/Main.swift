//
//  Main.swift
//  PitchDark
//
//  Created by Sanaz Khosravi on 11/2/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import Foundation

class Main{
    
    var temp: Double
    var pressure: Int
    var humidity : Int
    
    
    init(dictionary: [String: Any]) {
        temp = dictionary["temp"] as? Double ?? 0.0
        pressure = dictionary["pressure"] as? Int ?? 0
        humidity = dictionary["humidity"] as? Int ?? 0
        
    }
    
    class func weatherMainInfo(dictionaries: [[String: Any]]) -> [Main] {
        var weatherMainInfos: [Main] = []
        for dictionary in dictionaries {
            let main = Main(dictionary: dictionary)
            weatherMainInfos.append(main)
        }
        return weatherMainInfos
    }
}
