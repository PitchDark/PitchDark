//
//  WeatherAPIManager.swift
//  Instagram
//
//  Created by Sanaz Khosravi on 11/2/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import Foundation

class WeatherAPIManager{
    private let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "b73655145bb7a29af554f932f777831e"
    
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func fetchCurrentWeather(lat : Int , lon : Int , completion: @escaping ([Weather]?, Error?) -> ()) {
        let url = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)?lat=\(lat)&lon=\(lon)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
               let weatherDictionaries = dataDictionary["weather"] as! [[String: Any]]
                
                let weathers = Weather.weatherInfo(dictionaries: weatherDictionaries)
                completion(weathers, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }

    
    func fetchCurrentWindWeather(lat : Int , lon : Int , completion: @escaping ([Wind]?, Error?) -> ()) {
        let url = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)?lat=\(lat)&lon=\(lon)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let windDictionaries = dataDictionary["wind"] as! [[String: Any]]
                
                let winds = Wind.windInfo(dictionaries: windDictionaries)
                completion(winds, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    
    func fetchCurrentMainWeather(lat : Int , lon : Int , completion: @escaping ([Main]?, Error?) -> ()) {
        let url = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)?lat=\(lat)&lon=\(lon)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let mainDictionaries = dataDictionary["main"] as! [[String: Any]]
                
                let mains = Main.weatherMainInfo(dictionaries: mainDictionaries)
                completion(mains, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
}
