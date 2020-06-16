//
//  FiltersViewController.swift
//  Biblioteka
//
//  Created by Pawel on 07.06.2020.
//  Copyright © 2020 PSW. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource  = self
    }
    
    let filters = [["filtr1","filtr2","filtr3"],["filtr1","filtr2","filtr3"],["filtr1","filtr2","filtr3","filtr4"]]
    let headerTitles = ["Forma i typ", "Dostepnosc", "Autor"]
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return filters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath)
        
        cell.textLabel!.text = filters[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        return nil
    }
    
    @IBAction func checkBoxTapped(_ sender: UIButton)
    {
        if sender.isSelected
        {
            sender.isSelected = false
        }
        else
        {
            sender.isSelected = true
        }
    }}
