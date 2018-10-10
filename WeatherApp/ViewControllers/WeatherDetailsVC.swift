//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 9/11/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit

class WeatherDetailsVC: UIViewController {
    
    @IBOutlet weak var WeatherIcon: UIImageView!
    @IBOutlet weak var CityName: UILabel!
    @IBOutlet weak var Temperature: UILabel!
    @IBOutlet weak var Summary: UILabel!    
    @IBOutlet weak var Humidity: UILabel!
    @IBOutlet weak var Wind: UILabel!
    @IBOutlet weak var Pressure: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var model:Weather? = Weather()
    
    
    //Forecast TableView from WeatherDetailsVC
     

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //Set reuse identifier for the ForecastTablViewCell
//        let nib = UINib(nibName: "ForecastTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "ForecastTableViewCell")
        
        
        NetworkingManager.ApiCall(completionHandler: {
                        (model,error) in
                self.model = model
                self.tableView.reloadData()
                    })
        
    }
}

    extension WeatherDetailsVC: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model?.dailyModel?.count ?? 0  // hard code value
           // make it adjustable according to the api data.
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ForecastTableViewCell
            //take out the model from the array and set the value of the cell.
            
           // how to take the element from the array.
            
            
            let rowNumber = indexPath.row
            
            let modelArray = model?.dailyModel
            
            let modelForRow = modelArray![rowNumber]
            cell.setModel(high: modelForRow.temperatureHigh!, low: modelForRow.temperatureLow!, imageName: modelForRow.icon!, day: modelForRow.day!)  // time is in double.
            
            return cell
            
        }
        
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            // take out the xib and set the header view
            
        
        }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 90
        }
        
}
