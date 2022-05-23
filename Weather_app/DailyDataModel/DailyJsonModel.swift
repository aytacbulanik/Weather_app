//
//  DailyJsonModel.swift
//  Weather_app
//
//  Created by aytaç bulanık on 23.05.2022.
//

import Foundation

struct DailyJSONModel : Codable {
    let daily : [Daily]
}

struct Daily : Codable {
    let dt : String
    let temp : Temp
}

struct Temp : Codable {
    let max : Double
    let min : Double
}
