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
    case SomethingWentWrong(String)
    
}

enum ESummary:String{  //enum name
    
    case clearNight = "Clear-Night"
    case ClearDay = "Clear-day"
    case partlyCloudNight = "partly-cloudy-night"
    case particloudDay = "partly-cloudy-day"
    case rain = "Rain"
    case snow = "Snow"
    case sleet = "sleet"
    case wind = "Wind"
    case fog = "fog"
    case cloudy = "Cloudy"
    
    init(summary:String){  // parameter name.
        switch summary.lowercased() {
        case "clear-night":
            self = .clearNight
        case "clear-day":
            self = .ClearDay
            
        case "partly-cloudy-night":
            self = .partlyCloudNight
        case "partly-cloudy-day":
            self  = .particloudDay
        case "rain":
            self = .rain
        case "snow":
            self = .snow
        case "sleet":
            self = .sleet
        case "wind":
            self = .wind
        case "fog":
            self = .fog
        case "cloudy":
            self = .cloudy
        default:
            self = .ClearDay
        }
    }
}

class Weather {
    var icon:ESummary?
    var temperature:Double?
    var summary: String?
    var humidity:Double?
    var wind:Double?
    var pressure:Double?
    var dailyModel:[DailyModel]?
}

class DailyModel{
    var day:String?
    var temperatureLow:Double?
    var temperatureHigh:Double?
    var icon:ESummary?
}

class NetworkingManager{
//trailing closure//
   static var cityName:String = ""
   static  var longitude:Double = 000
   static var latitude:Double  = 000
    
    func abc(){
        print("hello")
    }
    
static func ApiCall(completionHandler: @escaping (_ model:Weather?,_ error:SerializationError?) ->Void){  // making a closure/Fucntion as a paramter.
    
    //define the url.
    
    // the darsky url
    let latAndLong:(Double,Double) = Utilites.getLongAndLat(key:cityName)
    let darkSkyUrl:URL = URL(string: "https://api.darksky.net/forecast/9d95f80f662ac1dc39c7b33f9e2673e9/\(latAndLong.0),\(latAndLong.1)") as! URL
    //trailing clousure
    let _ = URLSession.shared.dataTask(with: darkSkyUrl) { (data, response, error) in
        
        
        //check for the error.
        
        //if error occurs, then terminate the flow process.
        
        if let _ = error {
            // just put errorpopop
            
            completionHandler(nil,SerializationError.SomethingWentWrong("SomeThing Went Wrong"))
            return
            
        }
        
    // check for the data also.
        
        
        guard let content = data else{
            // put Error popop
            completionHandler(nil,SerializationError.SomethingWentWrong("SomeThing Went Wrong"))
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
                    finalObj.icon = ESummary(summary:icon)
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
                            //from this time just calculate the day.
                            // convert this time into data
                            
                            
                            let date = Date(timeIntervalSince1970: time)
                            // get the day name.
                            
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat  = "EEEE"//"EE" to get short style
                            let dayInWeek = dateFormatter.string(from: date)
                            model.day = dayInWeek
                            
                        }
                        if let temperatureHigh = item["temperatureHigh"] as? Double{
                         model.temperatureHigh = temperatureHigh
                        }
                        
                        if let temperatureLow :Double = item["temperatureLow"] as? Double{
                            model.temperatureLow = temperatureLow
                        }
                        if let icon = item["icon"] as? String{
                            model.icon = ESummary(summary: icon)
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





