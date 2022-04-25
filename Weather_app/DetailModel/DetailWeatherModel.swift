//
//  DetailWeatherModel.swift
//  Weather_app
//
//  Created by aytaç bulanık on 19.04.2022.
//

import Foundation

struct DetailWeatherModel {
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
    let currentWeatherDetail : DetailLittleWeatherModel
    
    var stringDate : String {
        let date = Date(timeIntervalSince1970: dt)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.long //Set date style
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}

struct DetailLittleWeatherModel {
    let id : Int
    let description : String
    let main : String
}


 
