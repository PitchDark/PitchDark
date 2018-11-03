//
//  Wind.swift
//  PitchDark
//
//  Created by Sanaz Khosravi on 11/2/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import Foundation

class Wind{
    
    var speed: Double
    var degree: Int
    
    
    init(dictionary: [String: Any]) {
        speed = dictionary["speed"] as? Double ?? 0.0
        degree = dictionary["deg"] as? Int ?? 0
        
    }
    
    class func windInfo(dictionaries: [[String: Any]]) -> [Wind] {
        var windInfo: [Wind] = []
        for dictionary in dictionaries {
            let wind = Wind(dictionary: dictionary)
            windInfo.append(wind)
        }
        return windInfo
    }
}
