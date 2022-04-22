//
//  DetailJSONModel.swift
//  Weather_app
//
//  Created by aytaç bulanık on 19.04.2022.
//

import Foundation

struct DetailJSONModel :Codable {
    let lat : Double
    let lon : Double
    let current : Current
    let minutely : [Minutely]
    let hourly : [Hourly]
}

struct Current : Codable {
    let temp : Double
    let feels_like : Double
    let pressure : Int
    let humidity : Double
    let uvi : Double
    let dt : Double
}

struct Minutely : Codable {
    
}

struct Hourly : Codable {
    
}
