//
//  WelcomeVC.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 9/11/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var Add: UIBarButtonItem!
    @IBOutlet weak var Refresh: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
  
    //var model:[WelcomeScreenStruct]?
    var numberOFRows:Int = 4
    var welcomeModel:[WelcomeModel]  = []
        override func viewDidLoad() {

        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        //Set reuse identifier for the WelcomeTableViewCell
        let nib = UINib(nibName: Strings.CellsNames.welcomeCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Strings.CellsNames.welcomeCell)
        //hard Code the model.
       // model = [WelcomeScreenStruct(cityName: "NEW YORK"), WelcomeScreenStruct(cityName: "DenMark"),WelcomeScreenStruct(cityName: "California"), WelcomeScreenStruct(cityName: "London")]
       
//        NetworkingManager.ApiCall{model,error in
//
//        }
        
//        NetworkingManager.ApiCall(completionHandler: {
//            (model,error) in
//        })
//
//
//        NetworkingManager.ApiCall(completionHandler: functionName)
//
    }
    
    func functionName(_ model:Weather,_ error:SerializationError?){
        
    }
    
    func refresh() {
        
    }
    
    @IBAction func refreshTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchCitiesVC") as! SearchCitiesVC
        self.navigationController?.pushViewController(vc, animated: true)
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
        return numberOFRows // nil collescing
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WelcomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: Strings.CellsNames.welcomeCell, for: indexPath) as! WelcomeTableViewCell
       // let cellModel:WelcomeScreenStruct? = model?[indexPath.row]
        cell.cityName.text = "NewYork"
        cell.delegate = self
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // pushing whether detail vc.
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchCitiesVC") as! SearchCitiesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //self.tableArray.remove(at: indexPath.row)
            numberOFRows = numberOFRows - 1
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

extension WelcomeVC:WelcomeTableCellDelegate{
    
    func deleteButtonTapped(cell: WelcomeTableViewCell) {
        
    }
}

extension WelcomeVC:SearchCityProtocol{
    func citySelect(cityName:String){
        //call the api and show loader to this screen . When the data come to the screen and store it in core data and make refresh tableView.
        
        //call the api
        
        NetworkingManager.cityName = cityName
        
        NetworkingManager.ApiCall { (model, error) in
            //
            //flatmap
            
            
            // preparing a model
            let welcomeModel:WelcomeModel = MakeModel().prepareModel(model: model, city: cityName)
            
           
        }
        
        
        
        
    }
}
