//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 9/11/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit

class WeatherDetails: UIViewController {

    @IBOutlet weak var WeatherIcon: UIImageView!    
    @IBOutlet weak var CurrentTemp: UILabel!
    @IBOutlet weak var CityName: UILabel!
    @IBOutlet weak var Humidity: UILabel!
    @IBOutlet weak var WindSpeed: UILabel!
    @IBOutlet weak var Pressure: UILabel!

    @IBOutlet var ContentView: ForecastViewCell!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
