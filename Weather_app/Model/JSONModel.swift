//
//  JSONModel.swift
//  Weather_app
//
//  Created by aytaç bulanık on 12.04.2022.
//

import Foundation

struct JSONModel : Codable{
    let main : Main
    let name :String
    let weather : [Weather]
}

struct Main : Codable {
    let temp : Double
}

struct Weather : Codable {
    let id : Int
}

