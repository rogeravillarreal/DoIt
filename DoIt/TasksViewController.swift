//
//  TasksViewController.swift
//  DoIt
//
//  Created by Roger Villarreal on 12/15/16.
//  Copyright © 2016 Roger Villarreal. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Create an array with Task objects
    var tasks : [Task] = []
    
    // Create an index for selected task
    var selectedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Add the tasks (task1, task2, etc) to the array
        tasks = maketasks()
        
        // Look at own contents to specify what objects and how many rows to show
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // This tells you if you are running out of memory
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    
    //How many rows in sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // This specifiy what object goes into the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️ \(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // This selects the index number of the row in array of selected task
        selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
        
    }
    
    func maketasks() -> [Task] {
        
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy Cheese"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Mow the lawn"
        task3.important = false
        
        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
}

