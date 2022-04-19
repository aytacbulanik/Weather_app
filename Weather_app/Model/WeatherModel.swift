//
//  WeatherModel.swift
//  Weather_app
//
//  Created by aytaç bulanık on 12.04.2022.
//

import Foundation
import CoreLocation

struct WeatherModel {
    let conditionId : Int
    let city : String
    let tempeture : Double
    let longidude : CLLocationDegrees
    let latidude : CLLocationDegrees
    
    var tempetureString : String {
        return String(format: "%.1f", tempeture)
    }
    
    
}
