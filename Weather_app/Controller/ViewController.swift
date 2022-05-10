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
    var hourlyDataManagementObject = HourlyDataManagement()
    var weatherObject : WeatherModel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTemperatureLabel: UILabel!
    
    @IBOutlet weak var cityNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       weatherManagerObject.weatherManagerDelegateObject = self
        detailWeatherManagerObject.detailDeegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
      // weatherManagerObject.weatherRequestUrl(city: "Hatay")
       detailWeatherManagerObject.sendDetailWeather(longitude: 36.25, latitude: 36.5)
        hourlyDataManagementObject.resolveJSON(longitude: 36.25, latidude: 36.5)
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
        
    }
    
    func detailDidFail(error: Error) {
        print(error.localizedDescription)
    }
}

//collectionView functions

extension ViewController : UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

