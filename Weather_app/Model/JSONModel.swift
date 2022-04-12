//
//  JSONModel.swift
//  Weather_app
//
//  Created by aytaç bulanık on 12.04.2022.
//

import Foundation

struct JSONModel : Codable{
    let main : Main
    
}

struct Main : Codable {
    let temp : Double
}

