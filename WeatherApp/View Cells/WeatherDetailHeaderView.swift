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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func intialise(weatherIcon:UIImage,cityName:String,temperature:UILabel,summary:String) {
        
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
