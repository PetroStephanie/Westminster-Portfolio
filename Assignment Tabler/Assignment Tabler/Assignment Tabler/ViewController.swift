//
//  ViewController.swift
//  Assignment Tabler
//
//  Created by Stephanie Petrosyants on 6/3/19.
//  Copyright © 2019 CSLocal. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Shopping List"
        
        // Creates the add button to insert new to-do items in the to-do list
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.didTapAddItemButton(_:)))
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        }
    
    // Gives the table view its Data Source to implement the few methods to have them work
    //private var todoItems = ToDoItem.getMockData()
    
    private var todoItems = [ToDoItem]()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // sets up UI and the rows
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_todo", for: indexPath)
        
        if indexPath.row < todoItems.count {
            
            let item = todoItems[indexPath.row]
            cell.textLabel?.text = item.title
            
            let accessory: UITableViewCell.AccessoryType = item.done ? .checkmark : .none
            cell.accessoryType = accessory
        }
        
        return cell
    }
    
    // Allows the user to mark tasks on the to do list as "completed/done"
    // Method is called whenever the user taps on a row in the table view.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row < todoItems.count {
            
            let item = todoItems[indexPath.row]
            item.done = !item.done
            
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    // Allows the user to either add or remove items from the to-do list.
    
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem) {
        
        // Creates an alert
        let alert = UIAlertController(
            title: "New Shopping Item",
            message: "Add Item to Shopping List: ",
            preferredStyle: .alert)
        
        // Adds a text field to the alert for the new items name
        
        alert.addTextField(configurationHandler: nil)
        
        // Adds a cacnel button to the alert
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Adds an Ok button to the alert.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let title = alert.textFields?[0].text {
                
                self.addNewToDoItem(title: title)
            }
        }))
        
        // Presents the alert to the user. Nil means NULL in swift.
        self.present(alert, animated: true, completion: nil)
    }
    
    private func addNewToDoItem(title: String) {
        
        // The new items index will be added to the current item count
        let newIndex = todoItems.count
        
        // Creates new items and adds it to the todo items list
        todoItems.append(ToDoItem(title: title))
        
        // Tells the table view a new row has been created
        
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
        
    }
    
    // Function that will remove items from the list
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if indexPath.row < todoItems.count {
            
            todoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
}



    
    


