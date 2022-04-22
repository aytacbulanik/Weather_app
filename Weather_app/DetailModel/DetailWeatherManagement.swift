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
        fetchJSON(urlString: urlString)
    }
    
    func fetchJSON(urlString : String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                if let jsonData = data {
                    let weather = self.decodeJson(jsondata: jsonData)
                    print(weather)
                }
            }
            task.resume()
        }
    }
    
    func decodeJson(jsondata : Data) -> DetailWeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(DetailJSONModel.self, from: jsondata)
            let temp = decodeData.current.temp
            let feels_like = decodeData.current.feels_like
            let pressure = decodeData.current.pressure
            let humidity = decodeData.current.humidity
            let uvi = decodeData.current.uvi
            let detailWeather = DetailWeatherModel(temp: temp, feels_like: feels_like, pressure: pressure, humidity: humidity, uvi: uvi)
            return detailWeather
        }catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
