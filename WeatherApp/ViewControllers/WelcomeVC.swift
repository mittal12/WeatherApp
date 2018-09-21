//
//  WelcomeVC.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 9/11/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var AddCity: UIBarButtonItem!
    @IBOutlet weak var Refresh: UIBarButtonItem!
    @IBOutlet weak var Edit: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
  
    var model:[WelcomeScreenStruct]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        //Set reuse identifier for the WelcomeTableViewCell
        let nib = UINib(nibName: Strings.CellsNames.welcomeCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Strings.CellsNames.welcomeCell)
        //hard Code the model.
        
        model = [WelcomeScreenStruct(cityName: "NEW YORK"), WelcomeScreenStruct(cityName: "DenMark"),WelcomeScreenStruct(cityName: "California"), WelcomeScreenStruct(cityName: "London")]
        
    }
    
    @IBAction func refreshTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    @IBAction func editTapped(_ sender: Any) {
        
    }
}

// only contain tableViewdelegate methods
extension WelcomeVC:UITableViewDelegate{
    func abc(){
        
    }
}

extension WelcomeVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.count ?? 0 // nil collescing
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WelcomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: Strings.CellsNames.welcomeCell, for: indexPath) as! WelcomeTableViewCell
        let cellModel:WelcomeScreenStruct? = model?[indexPath.row]
        cell.cityName.text = cellModel?.cityName ?? ""
        cell.delegate = self
        return cell
    }
    
}

// only contains mathematical functions

extension WelcomeVC:WelcomeTableCellDelegate{
    
    func deleteButtonTapped(cell: WelcomeTableViewCell) {
        //the specific delete item will be removed from the tableView.
//        6
//        //procedure?
////        i have to find the index of the row which i have to delete .
//        i will delete the entity number 2 in the model
//
//        5
//        
//        i will refrsh the tableView.
//

    }
}
