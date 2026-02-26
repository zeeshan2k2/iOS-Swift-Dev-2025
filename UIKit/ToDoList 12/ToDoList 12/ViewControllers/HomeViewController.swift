//
//  ViewController.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 01/09/2025.
//

import UIKit
import os
import CoreData

class HomeViewController: UIViewController {

    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var settingsBtn: UIButton!
    
    
    var tasks: [TaskModel] = []
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.tintColor = .white
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.layer.transform = CATransform3DMakeScale(1.4, 1.4, 1.4)
        button.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        titleView.clipsToBounds = true
        titleView.layer.cornerRadius = 24
        titleView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(addButton)
        
        NotificationCenter.default.addObserver(self, selector: #selector(createTask(_:)), name: NSNotification.Name("com.fullstacktuts.createTask"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(editTask(_:)), name: NSNotification.Name("com.fullstacktuts.editTask"), object: nil)
        
        fetchTasks()
    }
    
    @objc func editTask(_ notificaiton: Notification) {
        //FIXME: - Edit task with Core Data
        guard let userInfo = notificaiton.userInfo,
              let taskToUpdate = userInfo["updateTask"] as? TaskModel else {
            return
        }
        let taskIndex = tasks.firstIndex { task in
            task.id == taskToUpdate.id
        }
        guard let taskIndex = taskIndex else {
            return
        }
        tasks[taskIndex] = taskToUpdate
        tableView.reloadData()
    }
    
    @objc func createTask(_ notificaiton: Notification) {
        os_log("Task received by the notification observer", type: .info)
        guard let userInfo = notificaiton.userInfo,
              let task = userInfo["newTask"] as? TaskModel else {
            return
        }
        tasks.append(task)
        tableView.reloadData()
        os_log("Task successfully created", type: .info)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let safeAreaBottom = view.safeAreaInsets.bottom
        let width: CGFloat = 60
        let height: CGFloat = 60
        let xPos = view.frame.width / 2 - width / 2
        let yPos = view.frame.height - height - safeAreaBottom
        addButton.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        addButton.layer.cornerRadius = width / 2
    }
    
    @objc func addButtonClicked() {
        let newTaskViewController = NewTaskViewController()
        present(newTaskViewController, animated: true)
    }
    
    @IBAction func settingsBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "SettingsSegue", sender: nil)
    }
    
    private func fetchTasks() {
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let request: NSFetchRequest<TaskModel> = TaskModel.fetchRequest()
        
        do {
            tasks = try context.fetch(request)
            tableView.reloadData()
        } catch {
            print("Failed to fetch tasks:", error)
        }
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as! TaskTableViewCell
        cell.configure(withTask: task, delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            context.delete(task)
            
            AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
            
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}


extension HomeViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let task = tasks[indexPath.row]
//        let newTaskViewController = NewTaskViewController(task: task)
//        present(newTaskViewController, animated: true)
//    }
}

extension HomeViewController: TaskTableViewCellDelegate {
    
    func editTask(task: TaskModel) {
        let newTaskViewController = NewTaskViewController(task: task)
        present(newTaskViewController, animated: true)
    }
    
    func markTask(task: TaskModel) {
        task.isComplete.toggle()
        
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        
        tableView.reloadData()
    }
}
