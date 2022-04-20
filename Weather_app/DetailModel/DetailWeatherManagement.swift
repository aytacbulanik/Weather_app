//
//  DetailWeatherManagement.swift
//  Weather_app
//
//  Created by aytaç bulanık on 20.04.2022.
//

import Foundation
import CoreLocation

struct DetailWeatherManagement {
    let apiDetailUrl = "https://api.openweathermap.org/data/2.5/onecall?exclude=daily&appid=39d3bb501d19a7b5f5d9449a0d69b76c&units=metric"
    
    func sendDetailWeather(longitude : CLLocationDegrees , latitude : CLLocationDegrees) {
        let urlString = "\(apiDetailUrl)&lon=\(longitude)&lat=\(latitude)"
        print(urlString)
    }
    
}
