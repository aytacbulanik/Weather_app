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
    var HourlyDataArray : [HourlyWeatherModel] = [HourlyWeatherModel]()
    
    @IBOutlet weak var cityNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Collection view hucrelerini elle tasarlarsak daha güzel bir goruntu oluştururuz.
        let tasarim : UICollectionViewFlowLayout = UICollectionViewFlowLayout() //hucre tasarım nesnesini oluşturduk
        let yukseklik = collectionView.frame.size.height-2 //tüm collectionview için genişliği tanımladık
        tasarim.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0) //her hucrenin kenarlardan uzaklığını belirledik
        tasarim.itemSize = CGSize(width: 60, height: yukseklik) //yatayda kaç hücre olduğunu tanımladık. Yükseklik değerini istersek başka bir oranla çarpabiliriz.
        tasarim.minimumInteritemSpacing = 2 //hucreler arası genişliği tanımladık
        tasarim.minimumLineSpacing = 2 // alt alta hucreler arası genişliği tanımladık
        tasarim.scrollDirection = .horizontal
        collectionView.collectionViewLayout = tasarim
       weatherManagerObject.weatherManagerDelegateObject = self
        detailWeatherManagerObject.detailDeegate = self
        hourlyDataManagementObject.hourlyManagerDelegateObject = self
        collectionView.delegate = self
        collectionView.dataSource = self
      // weatherManagerObject.weatherRequestUrl(city: "Hatay")
        detailWeatherManagerObject.sendDetailWeather(longitude: 36.25, latitude: 36.5)
        hourlyDataManagementObject.resolveJSON(longitude: 89, latidude: 2)
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

extension ViewController : HourlyManagerDelegate {
    func getHourlyData(hourlyData: [HourlyWeatherModel]) {
        DispatchQueue.main.async {
            self.HourlyDataArray.removeAll(keepingCapacity: true)
            self.HourlyDataArray = hourlyData
            self.collectionView.reloadData()
        }
    }
    
    
}

//collectionView functions

extension ViewController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HourlyDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! HourlyCollectionViewCell
        cell.hourLabel.text = "\(HourlyDataArray[indexPath.row].stringDate) "
        cell.tempLabel.text = "\(HourlyDataArray[indexPath.row].intToTemp) °"
        cell.weatherImage.image = UIImage(systemName: HourlyDataArray[indexPath.row].currentWeatherDetail.imageString)
        return cell
    }
    
    
}

