//
//  SearchCitiesVC.swift
//  WeatherApp
//
//  Created by Ashish Mittal on 25/10/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit

class SearchCitiesVC: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    let modelArray:[String] = ["New York","California","Boston","Washington","dallas","utah","texas","San Fransisco","Las Vegas","Denver"]
    
    var filteredModel:[String] = []
    
    var searchActive:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SearchTableViewCell")
        // same as delegation pattern
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
}

extension SearchCitiesVC:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return based on serachActive.
        
        if searchActive == true{
            return filteredModel.count
        }
        return modelArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as! SearchTableViewCell
        
        // take out model from the array
        if searchActive == true{
        let model = filteredModel[indexPath.row]
            cell.cityName.text = model
        }else{
        let model = modelArray[indexPath.row]
            cell.cityName.text = model
        }

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}

extension SearchCitiesVC:UISearchBarDelegate{
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("End")
        searchActive = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("begin editing ")
        searchActive = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search button clicked")
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel button clicked")
        searchActive = false
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("hello")
        // take the present text from the search bar.
        
        let text = searchBar.text
        // now apply filter
        filteredModel =  modelArray.filter { (item) -> Bool in
        let tmp:String = item
        let range = tmp.range(of: text ?? "", options: NSString.CompareOptions.caseInsensitive , range: nil, locale: nil)
        return range != nil
        }
        
        if (filteredModel.count == 0){
            searchActive = false;
        }else{
            searchActive = true
        }
        
        
        tableView.reloadData() // will call again
        
        
    }
}




