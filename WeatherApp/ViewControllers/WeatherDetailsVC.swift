//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 9/11/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit

class WeatherDetailsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var model:Weather? = Weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set reuse identifier for the ForecastTableViewCell
       let nib = UINib(nibName: "ForecastTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "ForecastTableViewCell")
        
        let nib1 = UINib(nibName: "WeatherDetailHeaderView", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "WeatherDetailHeaderView")
       
        self.tableView.delegate = self
        self.tableView.dataSource = self

        NetworkingManager.ApiCall(completionHandler: {
                        (model,error) in
            
            DispatchQueue.main.async {
                self.model = model
                self.tableView.reloadData()
                
            }
                    })
        
    }
}

    extension WeatherDetailsVC: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model?.dailyModel?.count ?? 0  // hard code value
           // make it adjustable according to the api data.
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell") as! ForecastTableViewCell
            //take out the model from the array and set the value of the cell.
            
           // how to take the element from the array.
            
            
            let rowNumber = indexPath.row
            
            let modelArray = model?.dailyModel
            
            let modelForRow = modelArray![rowNumber]
            cell.setModel(high: modelForRow.temperatureHigh!, low: modelForRow.temperatureLow!, imageName: modelForRow.icon!, day: modelForRow.day!)  // time is in double.
            return cell
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

            let weatherHeader = tableView.dequeueReusableCell(withIdentifier: "WeatherDetailHeaderView") as!
                WeatherDetailHeaderView
            weatherHeader.initialise(weatherIcon: (model?.icon) ?? .ClearDay , cityName: "New York" , temperature: model?.temperature  ?? 82, summary: model?.summary  ?? "Partly Cloudy", humidity: model?.humidity  ?? 60, pressure: model?.pressure  ?? 29.5, wind: model?.wind  ?? 29.5)
            return weatherHeader
            // take out the xib and set the header view
            
        }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 449
        }
        
}
