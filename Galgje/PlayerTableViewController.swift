//
//  PlayerTableViewController.swift
//  Galgje
//
//  Created by docent on 15/11/2021.
//

import Foundation
import UIKit

class PlayerTableViewController : UITableViewController
{
    
    var users = ["Marc": 4,
                 "Dirk": 5]
    var highScores : [String] = [];
    
    for name in users.keys
    {
        highScores.append(name+" - " + users[name])
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel!.text = highScores[indexPath.row]
        
        return cell
    }
    
}
