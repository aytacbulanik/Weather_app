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
    let icon : String
    
    var imageString : String {
        var imageName = ""
        switch id {
        case 200...232 : imageName = "tornado"
        case 300...311 : imageName = "cloud.drizzle.fill"
        case 312...321 : imageName = "cloud.bolt.rain"
        case 500...504 : imageName = "cloud.heavyrain"
        case 511 : imageName = "cloud.fog"
        case 520...531 : imageName = "cloud.sleet"
        case 600...613 : imageName = "cloud.hail.fill"
        case 614...622 : imageName = "cloud.snow"
        case 701...751 : imageName = "smoke"
        case 761...781 : imageName = "wind"
        case 800 : imageName = "sun.max.fill"
        case 801 : imageName = "sun.max"
        case 802 : imageName = "sun.min"
        case 803 : imageName = "cloud"
        case 804 : imageName = "cloud.fill"
        default : imageName = ""
        }
        return imageName
    }
}


 
