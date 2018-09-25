//
//  DarkSkyApiManager.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 9/14/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import Foundation

struct Weather {
    let icon:String
    let temperature:Double
    let summary: String
    let humidity:Double
    let wind:Double
    let pressure:Double
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    
}
