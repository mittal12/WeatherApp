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
    @IBOutlet weak var delete: UIButton!
    

    
    var delegate:WelcomeTableCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        self.delegate?.deleteButtonTapped(cell: self)
    }
    
    
}
