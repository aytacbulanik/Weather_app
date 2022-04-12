//
//  WeatherManager.swift
//  Weather_app
//
//  Created by aytaç bulanık on 12.04.2022.
//

import Foundation

struct WeatherManager {
    let apiUrl = "https://api.openweathermap.org/data/2.5/weather?appid=39d3bb501d19a7b5f5d9449a0d69b76c&units=metric"
    
    func weatherRequestUrl(city :String) -> String{
        let urlString = "\(apiUrl)&q=\(city)"
        return urlString
    }
    
    func resolveJSON(urlString : String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                if let JSONdata = data {
                    if let data = JSONdata.parse
                }
            }
        }
    }
    
    
}
