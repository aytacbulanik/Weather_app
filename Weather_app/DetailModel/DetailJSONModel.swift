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
}

struct Current : Codable {
    let dt : Double
    let sunrise : Double
    let sunset : Double
    let temp : Double
    let feels_like : Double
    let pressure : Int
    let humidity : Double
    let uvi : Double
    let wind_speed : Double
    let wind_deg : Double
    let weather : [WeatherDetail]
}

struct WeatherDetail : Codable {
    let id : Int
    let main : String
    let description : String
    let icon : String
}



