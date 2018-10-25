//
//  SearchVC.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 9/11/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit
import CoreLocation

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
  
    @IBOutlet weak var tableView: UITableView!
    
    let modelArray:[String] = ["New York","California","Boston","Washington","dallas","utah","texas","San Fransisco","Las Vegas","Denver"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SearchTableViewCell")
        // same as delegation pattern
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

}

extension SearchVC:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as! SearchTableViewCell
        
        // take out model from the array
        let model = modelArray[indexPath.row]
        cell.cityName.text = model
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}


extension SearchVC:UISearchBarDelegate{
    
}
