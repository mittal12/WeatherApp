//
//  SearchCitiesVC.swift
//  WeatherApp
//
//  Created by Ashish Mittal on 25/10/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit
protocol SearchCityProtocol :class{
    func citySelect(cityName:String)
}

class SearchCitiesVC: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var modelArray:[String] = ["New York","California","Boston","Washington","dallas","utah","texas","San Fransisco","Las Vegas","Denver"]
    
    var filteredModel:[String] = []
    var delegate:SearchCityProtocol?
    var searchActive:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SearchTableViewCell")
        // same as delegation pattern
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
       // modelArray.sort()
        
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
          //  else if (searchActive == true && filteredModel.count == 0){
//                return 0
//            }
        return modelArray.count

        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // popViewContoller.
        if searchActive == true{
        self.delegate?.citySelect(cityName: filteredModel[indexPath.row])
        }
        else{
            self.delegate?.citySelect(cityName: modelArray[indexPath.row])
        }
        self.navigationController?.popViewController(animated: true)
        
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
        searchActive = true
        searchBar.resignFirstResponder() // hide the keboard
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel button clicked")
        searchActive = false
        tableView.reloadData()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("hello")
        // take the present text from the search bar.
        
        let text:String = searchBar.text!
        filteredModel =  modelArray.filter { (item) -> Bool in
            return item.lowercased().contains(text.lowercased())
        }
        if(text.count == 0){
            searchActive = false
        }else{
            searchActive = true
        }
        
        tableView.reloadData() // will call again
    
    }
}




