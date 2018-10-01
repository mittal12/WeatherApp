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
    
    
    
}

class NetworkingManager{
//trailing closure//
static func ApiCall(completionHandler: @escaping (_ model:Weather,_ error:SerializationError?) ->Void){  // making a closure/Fucntion as a paramter.
    
    //define the url.
    
    // the darsky url
    
    let darkSkyUrl:URL = URL(string: "fjdhskdjfh.com") as! URL
    //trailing clousure
    let task = URLSession.shared.dataTask(with: darkSkyUrl) { (data, response, error) in
        
        
        //check for the error.
        
        //if error occurs, then terminate the flow process.
        
        guard let isError = error else{
            return
        }
        
    // check for the data also.
        
        
        guard let content = data else{
            return
        }
        
        
     //   Convert the data(in bytes) to the json form using deserialisation and extract the values from that Dictionary
        //optional
        let jsonObject =  try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as?  [String:Any]
       
        
        
        /*
         var icon:String
         var temperature:Double
         var summary: String
         var humidity:Double
         var wind:Double
         var pressure:Double

         */
        
        
        if var dict = jsonObject{
            // parse the model.
            var finalObj:Weather = Weather()

            //move to the current.
            dict = dict as? [String:Any]
            if let current = dict!["currently"] as? [String:Any]{
                
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
            }
            
          // make a closure tp give the callBack to the respective viewController//
            completionHandler(finalObj,nil)
        }
        
    }.resume()
    
    
    }

}
