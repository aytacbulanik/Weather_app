//
//  HourlyJSONModel.swift
//  Weather_app
//
//  Created by AYTAÇ BULANIK on 24.04.2022.
//

import Foundation

struct HourlyJSONModel : Codable {
    let hourly : [Hourly]
}

struct Hourly : Codable {
    let temp : Double
    let dt : Double
    let weather : [WeatherDetail]
}


