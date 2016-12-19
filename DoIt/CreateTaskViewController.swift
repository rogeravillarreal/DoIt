//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Roger Villarreal on 12/16/16.
//  Copyright © 2016 Roger Villarreal. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        // Create tasks from the outlet information
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        // Add tasks to array in previous ViewController
        previousVC.tasks.append(task)
        
        // Reloads the TableView from previous VC
        previousVC.tableView.reloadData()
        
        // Returns to previousVC to show added task
        navigationController!.popViewController(animated: true)
    }

}
