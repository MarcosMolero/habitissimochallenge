//
//  BudgetsVC.swift
//  habitissimochallenge
//
//  Created by Marcos Molero on 20/4/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import UIKit

class BudgetsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        performSegue(withIdentifier: "budgetDetailSegue", sender: instanceAppSingelton.listBudget[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let guest = segue.destination as! BudgetDetailVC
//        
//        guest.mickey = sender as! String
//        https://www.youtube.com/watch?v=peSXZi_nxek
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        instanceAppSingelton.listBudget = BudgetDAO.instance.getBudgets()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

