//
//  WriteTodoViewModel.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/19.
//

import Foundation

class WriteTodoViewModel {
    
    let todoRepository: TodoRepository
    var taskToEdit: TaskModel?
    
    init(todoRepository: TodoRepository, taskToEdit: TaskModel? = nil) {
        self.todoRepository = todoRepository
        self.taskToEdit = taskToEdit
    }
    
    func addTask(todoTask: TaskModel) {
        todoRepository.addTask(todoTask)
    }
    
    func editTask(todoTask: TaskModel) {
        guard let taskToEdit = taskToEdit else {
            return
        }
        
        todoRepository.removeTaskFromTodoList(taskToEdit)
        todoRepository.addTask(todoTask)
    }
}
