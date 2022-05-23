//
//  DetailWeatherManagement.swift
//  Weather_app
//
//  Created by aytaç bulanık on 20.04.2022.
//

import Foundation
import CoreLocation

protocol DetailWeatherManagementDelegate {
    func detailWeatherUpdate(detailWeather : DetailWeatherModel)
    func detailDidFail(error : Error)
}

struct DetailWeatherManagement {
    var detailDeegate : DetailWeatherManagementDelegate?
    let apiDetailUrl = "https://api.openweathermap.org/data/2.5/onecall?exclude=alerts&appid=39d3bb501d19a7b5f5d9449a0d69b76c&units=metric&lang=tr"
    
    func sendDetailWeather(longitude : CLLocationDegrees , latitude : CLLocationDegrees) {
        let urlString = "\(apiDetailUrl)&lon=\(longitude)&lat=\(latitude)"
        fetchJSON(urlString: urlString)
    }
    
    func fetchJSON(urlString : String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    detailDeegate?.detailDidFail(error: error!)
                    return
                }
                if let jsonData = data {
                    if let detailWeather = self.decodeJson(jsondata: jsonData) {
                        detailDeegate?.detailWeatherUpdate(detailWeather: detailWeather)
                    }
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
            let dt = decodeData.current.dt
            let sunrise = decodeData.current.sunrise
            let sunset = decodeData.current.sunset
            let wind_speed = decodeData.current.wind_speed
            let wind_deg = decodeData.current.wind_deg
            
            let weatherId = decodeData.current.weather[0].id
            let description = decodeData.current.weather[0].description
            let main = decodeData.current.weather[0].main
            let icon = decodeData.current.weather[0].icon
            
            let detailWeather = DetailWeatherModel(temp: temp, feels_like: feels_like, pressure: pressure, humidity: humidity, uvi: uvi,dt: dt,sunrise: sunrise,sunset: sunset,wind_speed: wind_speed,wind_deg: wind_deg, currentWeatherDetail: DetailLittleWeatherModel(id : weatherId, description : description, main : main, icon : icon))
            return detailWeather
        }catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
