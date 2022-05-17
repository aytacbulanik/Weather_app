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
    let feels_like : Double
    let pressure : Int
    let humidity : Double
    let uvi : Double
    let dt : Double
    let sunrise : Double
    let sunset : Double
    let wind_speed : Double
    let wind_deg : Double
    let currentWeatherDetail : WeatherDetail
}
