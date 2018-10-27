//
//  WelcomeTableViewCell.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 9/14/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit

protocol WelcomeTableCellDelegate :class{
    func deleteButtonTapped(cell:WelcomeTableViewCell)
}

class WelcomeTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!   
    @IBOutlet weak var temperature: UILabel!
    
    
    var delegate:WelcomeTableCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
  
    
}
