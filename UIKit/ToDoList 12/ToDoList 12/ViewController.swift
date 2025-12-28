//
//  ViewController.swift
//  ToDoList 12
//
//  Created by Zeeshan Waheed on 01/09/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var tasks: [Task] = []
    
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
    }
    
    @objc func editTask(_ notificaiton: Notification) {
        guard let userInfo = notificaiton.userInfo,
              let taskToUpdate = userInfo["updateTask"] as? Task else {
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
        guard let userInfo = notificaiton.userInfo,
              let task = userInfo["newTask"] as? Task else {
            return
        }
        tasks.append(task)
        tableView.reloadData()
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
}


extension ViewController: UITableViewDataSource {
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
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}


extension ViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let task = tasks[indexPath.row]
//        let newTaskViewController = NewTaskViewController(task: task)
//        present(newTaskViewController, animated: true)
//    }
}

extension ViewController: TaskTableViewCellDelegate {
    
    func editTask(id: String) {
        let task = tasks.first { task in
            task.id == id
        }
        guard let task = task else {
            return
        }
        let newTaskViewController = NewTaskViewController(task: task)
        present(newTaskViewController, animated: true)
        tableView.reloadData()
    }
    
    func markTask(id: String, complete: Bool) {
        let taskIndex = tasks.firstIndex { task in
            task.id == id
        }
        guard let taskIndex = taskIndex else {
            return
        }
        tasks[taskIndex].isComplete = complete
        tableView.reloadData()
    }
}
