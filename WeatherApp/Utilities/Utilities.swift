//
//  Utilities.swift
//  WeatherApp
//
//  Created by Ashish Mittal on 27/10/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import Foundation
class Utilites{
    //["New York","California","Boston","Washington","dallas","utah","texas","San Fransisco","Las Vegas","Denver"]
    static var dict:[String: (Double,Double)] = [String: (Double,Double)]()
    /*
     
     NewYork     37.8267,-122.4233
     California  36.7783   119.4179
     Boston      42.3601   71.0589
     Washington  47.7511  120.7401
     Dallas      32.7767    96.7970
     Utah        39.3210    111.0937
     Texas       31.9686    99.9018
  San Francisco. 37.7746.  122.4194
     Las Vegas.  36.1699.  115.1398
     Denver.     39.7392.   104.9903
     */
    static func setLatAndLongitude(){
     
        dict["New York"] = (Double(37.8267) ,Double(122.4233))
        dict["California"] = (Double(36.7783) , Double(119.4179))
        dict["Boston"] = (Double(42.3601) , Double(71.0589))
        dict["Washington"] = (Double(47.7511) , Double(122.4233))
        dict["dallas"] = (Double(32.7767) , Double(96.7970))
        dict["utah"] = (Double(39.3210) , Double(111.0937))
        dict["texas"] = (Double(31.9686) , Double(99.9018))
        dict["San Fransisco"] = (Double(37.7746) , Double(122.4194))
        dict["Las Vegas"] = (Double(36.16997) , Double(115.1398))
        dict["Denver"] = (Double(39.7392) , Double(104.9903))
    }
    
    static func getLongAndLat(key:String) ->(Double,Double){
        return dict[key]!
    }
    
    
    
    
    
    
}
