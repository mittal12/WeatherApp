//
//  File.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 27/10/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import Foundation
class MakeModel{
    func prepareModel(model:Weather,city:String) -> WelcomeModel {
        let welcomeModel:WelcomeModel = WelcomeModel()
        welcomeModel.temperature = model.temperature
        welcomeModel.cityName = city
        return welcomeModel
    }
}
