//
//  TodoListViewModel.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/18.
//

import Foundation

class TodoListViewModel {
    
    let todoRepository: TodoRepository
    
    init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
    }
    
    var todoList: [TaskModel] {
        get {
            return todoRepository.todoList
        }
        set {
            todoRepository.todoList = newValue
        }
    }
    
    func addTask(_ task: TaskModel) {
        todoRepository.addTask(task)
    }
    
    func completeTask(_ index: Int) {
        todoRepository.completeTask(index)
    }
    
    func removeTaskFromTodoList(_ task: TaskModel) {
        todoRepository.removeTaskFromTodoList(task)
    }
}
