//
//  CompleteTodoViewController.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/13.
//

import UIKit

class CompleteTodoViewController: UIViewController {
    
    let todoRepository: TodoRepository
    
    init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let todoTableView: UITableView = {
        let tableView = UITableView()
       
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
        
        configureUI()
    }
}

extension CompleteTodoViewController {
    private func configureUI() {
        view.backgroundColor = .white
        
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(todoTableView)
        
        todoTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            todoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            todoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension CompleteTodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoRepository.completedTodoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = todoRepository.completedTodoList[indexPath.row]
        
        cell.textLabel?.text = task.todoText
        
        return cell
    }
}

extension CompleteTodoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deletedAction = UIContextualAction(style: .destructive, title: "삭제") { [weak self] (_, _, completionHandler) in
            
            self?.todoRepository.removeTaskFromCompletedTodoList(self?.todoRepository.completedTodoList[indexPath.row])
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            completionHandler(true)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deletedAction])
        
        return configuration
    }
}
