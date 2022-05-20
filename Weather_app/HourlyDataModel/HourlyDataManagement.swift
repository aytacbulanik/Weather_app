//
//  HourlyDataManagement.swift
//  Weather_app
//
//  Created by AYTAÇ BULANIK on 24.04.2022.
//

import Foundation
import CoreLocation

protocol HourlyManagerDelegate {
    func getHourlyData(hourlyData : HourlyWeatherModel)
}

struct HourlyDataManagement {
    var hourlyManagerDelegateObject : HourlyManagerDelegate?
    let apiURL = "https://api.openweathermap.org/data/2.5/onecall?exclude=alerts&appid=39d3bb501d19a7b5f5d9449a0d69b76c&units=metric&lang=tr"
    
    func resolveJSON(longitude : CLLocationDegrees , latidude : CLLocationDegrees) {
        let sendHourlyWeather = "\(apiURL)&lat=\(latidude)&lon=\(longitude)"
        getHourlyJSONData(urlString: sendHourlyWeather)
    }
    
    func getHourlyJSONData(urlString : String) {
        if let url = URL(string: urlString) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let jsonData = data {
                if let hourlyWeather = self.decodeJsonData(jsonData: jsonData) {
                    self.hourlyManagerDelegateObject?.getHourlyData(hourlyData: hourlyWeather)
                }
            }
        }
        task.resume()
        }
    }
    func decodeJsonData(jsonData : Data) -> HourlyWeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodeData = try decoder.decode(HourlyJSONModel.self, from: jsonData)
            let temp = decodeData.hourly[0].temp
            let dt = decodeData.hourly[0].dt
            let hourlyWeather = HourlyWeatherModel(temp: temp, dt: dt)
            return hourlyWeather
        }catch {
            print(error.localizedDescription)
            return nil
        }
       
    }
    
}
