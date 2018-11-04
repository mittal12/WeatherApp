//
//  ForecastViewCell.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 9/14/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var WeatherIcon: UIImageView!
    @IBOutlet weak var Day: UILabel!
    @IBOutlet weak var HighTemp: UILabel!
    @IBOutlet weak var LowTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setModel(high:Double,low:Double,imageName:ESummary,day:String){
        self.Day.text = day
        HighTemp.text = String(format:"%.0f ℉",high)
        LowTemp.text = String(format:"%.0f ℉",low)
        WeatherIcon.image = UIImage(named: imageName.rawValue)
    }

}
