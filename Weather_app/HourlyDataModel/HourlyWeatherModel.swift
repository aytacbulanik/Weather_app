//
//  HourlyWeatherModel.swift
//  Weather_app
//
//  Created by AYTAÇ BULANIK on 24.04.2022.
//

import Foundation

struct HourlyWeatherModel {
    let temp : Double
    let dt : Double
    let currentWeatherDetail : DetailLittleWeatherModel
    
    
    var stringDate : String {
        let date = Date(timeIntervalSince1970: dt)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let day = dateFormatter.string(from: date)
        dateFormatter.timeZone = .current
        return day
    }
    var intToTemp : Int {
        return Int(temp)
    }
}
