//
//  WeatherModel.swift
//  Weather_app
//
//  Created by aytaç bulanık on 12.04.2022.
//

import Foundation

struct WeatherModel {
    let conditionId : Int
    let city : String
    let tempeture : Double
    
    var tempetureString : String {
        return String(format: "%.1f", tempeture)
    }
    
}
