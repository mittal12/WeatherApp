//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 9/11/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit

class WeatherDetailsVC: UIViewController {
    //Set IB Outlets for WeatherDetailsVC
    @IBOutlet weak var WeatherIcon: UIImageView!    
    @IBOutlet weak var CurrentTemp: UILabel!
    @IBOutlet weak var CityName: UILabel!
    @IBOutlet weak var Humidity: UILabel!
    @IBOutlet weak var WindSpeed: UILabel!
    @IBOutlet weak var Pressure: UILabel!
    @IBOutlet weak var Summary: UILabel!
    
    //Forecast TableView from WeatherDetailsVC
     

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //Set reuse identifier for the ForecastTablViewCell
        let nib = UINib(nidName: "ForecastTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ForecastTableViewCell")
        
    }
    extension ViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
            return cell
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    }
}
