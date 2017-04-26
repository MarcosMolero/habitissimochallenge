//
//  BudgetsVC.swift
//  habitissimochallenge
//
//  Created by Marcos Molero on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import UIKit

class BudgetsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let instanceAppSingelton = AppSingleton.sharedInstance
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instanceAppSingelton.listBudget.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = instanceAppSingelton.listBudget[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        instanceAppSingelton.budget = instanceAppSingelton.listBudget[indexPath.row]
        performSegue(withIdentifier: "budgetDetailSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webServiceCommunication:WebServiceCommunication = WebServiceCommunication()
        webServiceCommunication.getLocations()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        instanceAppSingelton.listBudget = BudgetDAO.instance.getBudgets()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

