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
    var model:Weather?
    
    
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
            return 10  // hard code value
           // make it adjustable according to the api data.
            model?.dailyModel?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
            //take out the model from the array and set the value of the cell.
            
            return cell
            
        }

}
