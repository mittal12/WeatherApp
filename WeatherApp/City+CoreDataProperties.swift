//
//  City+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Ashish Mittal on 31/10/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var cityName: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var temperature: Double

}
