//
//  HolidayTableViewController.swift
//  MVC1
//
//  Created by Mac on 8.09.2019.
//  Copyright © 2019 Varol. All rights reserved.
//

import UIKit

class HolidayTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var listOfHoliday = [HolidayDetail]() {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listOfHoliday.count) Holidays found"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfHoliday.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let holiday = listOfHoliday[indexPath.row]
        cell.textLabel?.text = holiday.name
        cell.detailTextLabel?.text = holiday.date.iso
        // Configure the cell...

        return cell
    }



}
