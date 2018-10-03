//
//  DarkSkyApiManager.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 9/14/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import Foundation

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
    
}

class Weather {
    var icon:String?
    var temperature:Double?
    var summary: String?
    var humidity:Double?
    var wind:Double?
    var pressure:Double?
    var dailyModel:[DailyModel]?
}

class DailyModel{
    var time:Double?
    var temperatureLow:Double?
    var temperatureHigh:Double?
    var icon:String?
}

class NetworkingManager{
//trailing closure//
static func ApiCall(completionHandler: @escaping (_ model:Weather,_ error:SerializationError?) ->Void){  // making a closure/Fucntion as a paramter.
    
    //define the url.
    
    // the darsky url
    
    let darkSkyUrl:URL = URL(string: "https://api.darksky.net/forecast/9d95f80f662ac1dc39c7b33f9e2673e9/37.8267,-122.4233") as! URL
    //trailing clousure
    let _ = URLSession.shared.dataTask(with: darkSkyUrl) { (data, response, error) in
        
        
        //check for the error.
        
        //if error occurs, then terminate the flow process.
        
        if let _ = error {
            return
        }
        
    // check for the data also.
        
        
        guard let content = data else{
            return
        }
        
        
     //   Convert the data(in bytes) to the json form using deserialisation and extract the values from that Dictionary
        //optional
        let jsonObject =  try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as?  [String:Any]
       
        
        //data to string.
        
        
        print(jsonObject)
        
//        let responseString = String(data: data!, encoding: .utf8)
//        print("responseString = \(String(describing: responseString))")
//
        /*
         var icon:String
         var temperature:Double
         var summary: String
         var humidity:Double
         var wind:Double
         var pressure:Double

         */
        
        
        if let dict = jsonObject as? [String:Any]{
            // parse the model.
            let finalObj:Weather = Weather()

            //move to the current.
            if let current = dict["currently"] as? [String:Any]{
                
                if let icon:String = current["icon"] as? String{
                    finalObj.icon = icon
                }
                if let temperature:Double = current["temperature"] as? Double{
                    finalObj.temperature = temperature
                }
                if let summary:String = current["summary"] as? String{
                    finalObj.summary = summary
                }
                if let humidity:Double = current["humidity"] as? Double{
                    finalObj.humidity = humidity
                }
                if let wind:Double = current["wind"] as? Double{
                    finalObj.wind = wind
                }
                if let pressure:Double = current["pressure"] as? Double{
                    finalObj.pressure = pressure
                }
                
                //daily model.
                /*
                 time
                 temperatureHigh
                 temperatureLow
                 icon
                 */
                
            }
            
            if let daily = dict["daily"] as? [String:Any]{
                
                if let dataArray:[[String:Any]] = daily["data"] as? [[String : Any]]{
                    
                    //loop throught the array
                    //flatmap
                    
                    var arrayModel:[DailyModel] = []  // empty
                    for item in dataArray{
                        let model:DailyModel = DailyModel()
                        if let time :Double = item["time"] as? Double{
                            model.time = time
                        }
                        if let temperatureHigh = item["temperatureHigh"] as? Double{
                         model.temperatureHigh = temperatureHigh
                        }
                        
                        if let temperatureLow :Double = item["temperatureLow"] as? Double{
                            model.temperatureLow = temperatureLow
                        }
                        if let icon = item["String"] as? String{
                            model.icon = icon
                        }
                       arrayModel.append(model)
                        
                    }
                    finalObj.dailyModel = arrayModel
                }
            }
            
          // make a closure tp give the callBack to the respective viewController//
            completionHandler(finalObj,nil)
        }
        
    }.resume()
    
    
    }

}
