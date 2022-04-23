//
//  ViewController.swift
//  Weather_app
//
//  Created by aytaç bulanık on 12.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var weatherManagerObject = WeatherManager()
    var detailWeatherManagerObject = DetailWeatherManagement()
    var weatherObject : WeatherModel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTemperatureLabel: UILabel!
    
    @IBOutlet weak var cityNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       weatherManagerObject.weatherManagerDelegateObject = self
        detailWeatherManagerObject.detailDeegate = self
       weatherManagerObject.weatherRequestUrl(city: "Hatay")
       detailWeatherManagerObject.sendDetailWeather(longitude: 36.25, latitude: 36.5)
    }


}

extension ViewController : WeatherManagerDelegate {
    func weatherdidUpdate(weather: WeatherModel) {
      
    }
    func weatherFails(error: Error) {
        print(error.localizedDescription)
    }
}

extension ViewController : DetailWeatherManagementDelegate {
    func detailWeatherUpdate(detailWeather: DetailWeatherModel) {
        let date = Date(timeIntervalSince1970: detailWeather.sunrise)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
         print(localDate)
    }
    
    func detailDidFail(error: Error) {
        print(error.localizedDescription)
    }
    
    
}

