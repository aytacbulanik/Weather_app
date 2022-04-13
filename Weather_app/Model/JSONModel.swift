//
//  JSONModel.swift
//  Weather_app
//
//  Created by aytaç bulanık on 12.04.2022.
//

import Foundation
import CoreLocation

struct JSONModel : Codable{
    let main : Main
    let name : String
    let coord : Coord
    let weather : [Weather]
}

struct Coord : Codable {
    let lon : CLLocationDegrees
    let lat : CLLocationDegrees
}

struct Main : Codable {
    let temp : Double
}

struct Weather : Codable {
    let id : Int
}

