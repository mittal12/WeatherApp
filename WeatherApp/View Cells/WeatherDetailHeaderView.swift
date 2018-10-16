//
//  WeatherDetailHeaderView.swift
//  WeatherApp
//
//  Created by Ashish Mittal on 09/10/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit

class WeatherDetailHeaderView: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var wind: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func initialise(weatherIcon:String,cityName:String,temperature:Double,summary:String,humidity:Double,pressure:Double,wind:Double) {
    //define IBOutlets for the vars listed in line 25
//        self.weatherIcon.image = UIImage(named: "Cloudy")
//        self.cityName.text = cityName
//        self.temperature.text = String(temperature)
//        self.summary.text = summary
//        self.humidity.text = String(humidity)
//        self.pressure.text = String(pressure)
//        self.wind.text = String(wind)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
