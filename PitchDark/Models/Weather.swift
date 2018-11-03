//
//  Weather.swift
//  Instagram
//
//  Created by Sanaz Khosravi on 11/2/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import Foundation

class Weather{

    var main: String
    var description: String
    
    
    init(dictionary: [String: Any]) {
        main = dictionary["main"] as? String ?? "No Weather Info Available"
        description = dictionary["description"] as? String ?? "No Description"

    }
    
    class func weatherInfo(dictionaries: [[String: Any]]) -> [Weather] {
        var weatherInfos: [Weather] = []
        for dictionary in dictionaries {
            let weather = Weather(dictionary: dictionary)
            weatherInfos.append(weather)
        }
        return weatherInfos
    }
}
