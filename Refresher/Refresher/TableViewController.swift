//
//  TableViewController.swift
//  Pull to refresh
//
//  Created by Koulutus on 01/10/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    var array: [Int] = [1, 2, 3]
    var refresher: UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(TableViewController.populate), for: UIControlEvents.valueChanged)
        tableView.addSubview(refresher)

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
        
        // Configure the cell...

        return cell
    }
    
    func populate()
    {
        for i in 4...100
        {
            array.append(i)
        }
        refresher.endRefreshing()
        tableView.reloadData()
    }
 

}
