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
    @IBOutlet weak var tableView: UITableView!
    //var model:[WelcomeScreenStruct]?
    var detailModel:Weather?
    var welcomeModelArray:[WelcomeModel]  = []
    var cityObjects :[City] = []
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
        override func viewDidLoad() {

        super.viewDidLoad()
       // setEnableActivityIndicator(isEnable: true)
        fetchingFromCoreData()
       // setEnableActivityIndicator(isEnable: false)
        Utilites.setLatAndLongitude()
        activityIndicator.tintColor = .orange
        
        let nib = UINib(nibName: Strings.CellsNames.welcomeCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Strings.CellsNames.welcomeCell)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func fetchingFromCoreData(){
        if let modelArray:[City] = CoreDataStack.shared.fetchObjects(){
            cityObjects = modelArray
        }   else{
            print("elements")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func functionName(_ model:Weather,_ error:SerializationError?){
        
    }
    
    
    func setEnableActivityIndicator(isEnable:Bool){
        if isEnable {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false
        }
        else{
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchCitiesVC") as! SearchCitiesVC
        vc.delegate = self
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
       // return welcomeModelArray.count // nil collescing
        return cityObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WelcomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: Strings.CellsNames.welcomeCell, for: indexPath) as! WelcomeTableViewCell
        
       // let cellModel:WelcomeScreenStruct? = model?[indexPath.row]
//        cell.cityName.text = welcomeModelArray[indexPath.row].cityName
//
//        cell.temperature.text = String(format:"%.0f",welcomeModelArray[indexPath.row].temperature ?? "")
        
        let model = cityObjects[indexPath.row]
        cell.cityName.text = model.cityName
        cell.temperature.text = String(format:"%.0f",model.temperature ?? "")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // pushing whether detail vc.
        let vc = WeatherDetailsVC()
        vc.cityName = cityObjects[indexPath.row].cityName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataStack.shared.deleteEntry(name: cityObjects[indexPath.row].cityName ?? "")
            self.cityObjects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
          }
    }
    
}


extension WelcomeVC:SearchCityProtocol{
    func citySelect(cityName:String){
        //call the api and show loader to this screen . When the data come to the screen and store it in core data and make refresh tableView.
        
        //call the api
        
        NetworkingManager.cityName = cityName
        
        setEnableActivityIndicator(isEnable: true)
        //make a cpi call
        NetworkingManager.ApiCall { (model, error) in
            
            // preparing a model
            DispatchQueue.main.async{
                self.setEnableActivityIndicator(isEnable: false)
            }
            
            
            if let er = error{
                self.showAlert()
                return
            }
            
           //append this model to the data model for the tableview.
            
            if error  == nil{
                DispatchQueue.main.async {
                let city:City =  CoreDataStack.shared.createNewManagedObject() as! City
                city.cityName = cityName
                city.temperature = (model?.temperature)!
                CoreDataStack.shared.saveContext()
                self.cityObjects.append(city)
                self.tableView.reloadData()
            }
        }
        }
    }
}


extension WelcomeVC{
    func showAlert(){
        let alert = UIAlertController(title: "Error", message: "SomeThing went wrong", preferredStyle: .alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
