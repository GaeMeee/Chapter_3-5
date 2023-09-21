//
//  TodoListView.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/21.
//

import UIKit

class TodoListView: UIView {
    
    let todoTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: TodoTableViewCell.identifier)

        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TodoListView {
    private func configureUI() {
        configureTableView()
    }
    
    private func configureTableView() {
        self.addSubview(todoTableView)
        
        todoTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todoTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            todoTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            todoTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            todoTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
