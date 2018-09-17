//
//  WelcomeVC.swift
//  WeatherApp
//
//  Created by Edward L Richardson on 9/11/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import UIKit

class WelcomeVC: UITableViewController {

    @IBOutlet weak var AddCity: UIBarButtonItem!
    @IBOutlet weak var Refresh: UIBarButtonItem!
    @IBOutlet weak var Edit: UIBarButtonItem!
    
    @IBOutlet weak var WelcomeTableViewCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WelcomeTableViewCell.dataSource = self
        WelcomeTableViewCell.delegate = self
        
        //Set reuse identifier for the WelcomeTableViewCell
        let nib = UINib(nibName: "WelcomeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WelcomeTableViewCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
