//
//  WeatherManager.swift
//  Weather_app
//
//  Created by aytaç bulanık on 12.04.2022.
//

import Foundation

protocol WeatherManagerDelegate {
    func weatherdidUpdate(weather : WeatherModel)
    func weatherFails(error: Error)
}
struct WeatherManager {
    let apiUrl = "https://api.openweathermap.org/data/2.5/weather?appid=39d3bb501d19a7b5f5d9449a0d69b76c&units=metric"
    var weatherManagerDelegateObject : WeatherManagerDelegate?
    func weatherRequestUrl(city :String){
        let urlString = "\(apiUrl)&q=\(city)"
       resolveJSON(urlString: urlString)
    }
    
    func resolveJSON(urlString : String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    weatherManagerDelegateObject?.weatherFails(error: error!)
                    return
                }
                if let JSONdata = data {
                    if let weather = self.parseJSON(weatherData: JSONdata) {
                        self.weatherManagerDelegateObject?.weatherdidUpdate(weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(JSONModel.self, from: weatherData)
            let name = decodedData.name
            let temp = decodedData.main.temp
            let long = decodedData.coord.lon
            let lat = decodedData.coord.lat
            let conditionId = decodedData.weather[0].id
            let weather = WeatherModel(conditionId: conditionId, city: name, tempeture: temp, longidude: long, latidude: lat)
            return weather
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
}
