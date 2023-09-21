//
//  WrtieTodoViewController.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/13.
//

import UIKit

class TodoListViewController: UIViewController {
    
// MARK: - Properties
    let todoRepository: TodoRepository
    
    private let todoListView = TodoListView()
    
    init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        view = todoListView
    }
    
// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        todoListView.todoTableView.dataSource = self
        todoListView.todoTableView.delegate = self
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "작성", style: .done, target: self, action: #selector(writeButtonTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        todoListView.todoTableView.reloadData()
        
//        todoRepository.fetchTaskCoreData(tableView: todoListView.todoTableView)
    }
}



extension TodoListViewController {
    @objc func writeButtonTapped() {
        let writeTodoVC =  WriteTodoViewController(todoRepository: todoRepository, taskToEdit: nil)
        
        self.navigationController?.pushViewController(writeTodoVC, animated: true)
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        let rowIndex = sender.tag
        
        todoRepository.todoList[rowIndex].isSwitch = sender.isOn
//        todoRepository.todoCoreDataList![rowIndex].isComplete = sender.isOn
        
        todoListView.todoTableView.reloadRows(at: [IndexPath(row: rowIndex, section: 0)], with: .automatic)
        
        if sender.isOn {
            todoRepository.completeTask(rowIndex)
        }
        
        todoListView.todoTableView.reloadData()
    }
}

extension TodoListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Category.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Category.allCases[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "\n"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = Category.allCases[section]
        let taskInSection = todoRepository.filterCategory(category)
//        let taskCoreSetction = todoRepository.filterCore(category)
//        return taskInSection.count
        return taskInSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoListView.todoTableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.identifier, for: indexPath) as! TodoTableViewCell
        
        let category = Category.allCases[indexPath.section]
        let taskOfCategory = todoRepository.filterCategory(category)
//        let taskCoreData = todoRepository.filterCore(category)
        
        let task = taskOfCategory[indexPath.row]
//        let taskCore = taskCoreData[indexPath.row]
        
        cell.textLabel?.text = task.todoText
        cell.setSwitchStace(task.isSwitch)
        cell.todoSwitch.tag = indexPath.row
        cell.todoSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        
        return cell
    }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let category = Category.allCases[indexPath.section]
        let categoryTask = self.todoRepository.filterCategory(category)[indexPath.row]
//        let categroyCore = self.todoRepository.filterCore(category)[indexPath.row]
        
        let deletedAction = UIContextualAction(style: .destructive, title: "삭제") { [weak self] (_, _, completionHandler) in
            self?.todoRepository.removeTaskFromTodoList(categoryTask)
//            self?.todoRepository.context.delete(categroyCore)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            completionHandler(true)
        }
        
        let editedAction = UIContextualAction(style: .normal, title: "수정") { [weak self] (_, _, completionHandler) in

            let editTodoVC = WriteTodoViewController(todoRepository: self!.todoRepository, taskToEdit: categoryTask)
            
            self?.navigationController?.pushViewController(editTodoVC, animated: true)
            
            completionHandler(true)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deletedAction, editedAction])
        
        return configuration
    }
}

