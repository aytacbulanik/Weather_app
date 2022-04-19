//
//  ViewController.swift
//  Weather_app
//
//  Created by aytaç bulanık on 12.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var weatherManagerObject = WeatherManager()
    var weatherObject : WeatherModel?
    override func viewDidLoad() {
        super.viewDidLoad()
       weatherManagerObject.weatherManagerDelegateObject = self
       weatherManagerObject.weatherRequestUrl(city: "London")
    }


}

extension ViewController : WeatherManagerDelegate {
    func weatherdidUpdate(weather: WeatherModel) {
        print(weather.latidude)
      
    }
    
    func weatherFails(error: Error) {
        print(error.localizedDescription)
    }
    
    
}

