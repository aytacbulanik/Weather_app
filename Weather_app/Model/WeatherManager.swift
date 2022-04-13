//
//  WeatherManager.swift
//  Weather_app
//
//  Created by aytaç bulanık on 12.04.2022.
//

import Foundation

struct WeatherManager {
    let apiUrl = "https://api.openweathermap.org/data/2.5/weather?appid=39d3bb501d19a7b5f5d9449a0d69b76c&units=metric"
    
    func weatherRequestUrl(city :String){
        let urlString = "\(apiUrl)&q=\(city)"
       resolveJSON(urlString: urlString)
    }
    
    func resolveJSON(urlString : String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error)
                    return
                }
                if let JSONdata = data {
                    let weather = self.parseJSON(weatherData: JSONdata)
                    print(weather?.tempeture ?? 0.0)
                    print(weather?.city ?? "Boş")
                    print(weather?.conditionId ?? 0)
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
            let conditionId = decodedData.weather[0].id
            let weather = WeatherModel(conditionId: conditionId, city: name, tempeture: temp)
            return weather
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
}
