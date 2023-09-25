//
//  WriteTodoViewController.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/13.
//

import UIKit

class WriteTodoViewController: UIViewController {
    
    // MARK: - Property
    let todoRepository: TodoRepository
    var taskToEdit: TaskModel?
    
    private let writeTodoView = WriteTodoView()
    
    init(todoRepository: TodoRepository, taskToEdit: TaskModel?) {
        self.todoRepository = todoRepository
        self.taskToEdit = taskToEdit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = writeTodoView
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(writeButtonTapped))
        
        if let taskToEdit = taskToEdit {
            title = "수정"
            writeTodoView.todoTextField.text = taskToEdit.todoText
            if let categoryIndex = Category.allCases.firstIndex(of: taskToEdit.category) {
                writeTodoView.categorySegment.selectedSegmentIndex = categoryIndex
            } else {
                writeTodoView.categorySegment.selectedSegmentIndex = 0
            }
        } else {
            title = "작성"
        }
    }
}

// MARK: - Action
extension WriteTodoViewController {
    @objc func writeButtonTapped() {
        guard let todoText = writeTodoView.todoTextField.text, !todoText.isEmpty else {
            return
        }
        
        var selectedCategory: Category
        
        switch writeTodoView.categorySegment.selectedSegmentIndex {
        case 0:
            selectedCategory = .life
        case 1:
            selectedCategory = .work
        case 2:
            selectedCategory = .travel
        default:
            selectedCategory = .none
        }
        
        let todoTask = TaskModel(todoText: todoText, isSwitch: false, category: selectedCategory)
        
        if let taskToEdit = taskToEdit {
            todoRepository.removeTaskFromTodoList(taskToEdit)
        }
        
        todoRepository.addTask(todoTask)
        
        
        self.navigationController?.popViewController(animated: true)
    }
}
