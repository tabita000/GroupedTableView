//
//  ViewController.swift
//  GroupedTableView
//
//  Created by Tabita Sadiq on 2/29/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let petArray = [["Mammal", "Cat", "Dog", "Hamster", "gerbil", "rabbit"], ["Bird", "Parrot", "canary","finch"], ["fish", "whale", "goldfish", "sea horse", "shark"], ["reptile", "snake", "lizard", "turtle"]]
    
    let cellID = "cellID"
    
    @IBOutlet weak var petTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        petTable.dataSource = self
        petTable.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
        }
        let petName = petArray[indexPath.section][indexPath.row + 1]
        cell?.textLabel?.text = petName
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = petArray[indexPath.section][indexPath.row + 1]
        let alert = UIAlertController(title: "your choice", message: "\(selectedItem)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default, handler: {action -> Void in
        })
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    // Code for creating grouped table
    func numberOfSections(in tableView: UITableView) -> Int {
        petArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return petArray[section][0]
    }
    
}
