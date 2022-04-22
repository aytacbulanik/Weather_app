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
}

struct DetailLittleWeatherModel {
    let id : Int
    let description : String
    let main : String
}
